import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:intuji_infogrid/app/ui/app.dart';
import 'package:intuji_infogrid/core/constants/api_constant.dart';
import 'package:intuji_infogrid/core/constants/environment_constant.dart';
import 'package:intuji_infogrid/core/constants/storage_constant.dart';
import 'package:intuji_infogrid/core/di/di.dart';
import 'package:intuji_infogrid/core/imports/ui_imports.dart';
import 'package:intuji_infogrid/core/services/network_service/client/base_client.dart';
import 'package:intuji_infogrid/core/services/network_service/functions/get_header.dart';
import 'package:intuji_infogrid/core/services/storage_service/storage_service.dart';
import 'package:intuji_infogrid/core/utils/print_utils.dart';
import 'package:intuji_infogrid/route/app_route.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// A concrete implementation of [BaseClient] that handles HTTP requests using Dio.
///
/// This class provides methods for making HTTP requests (GET, POST, PUT, PATCH, DELETE)
/// with features like:
/// - Automatic token refresh on 401 errors
/// - Request caching
/// - Loading dialog management
/// - Multipart form data support
/// - Custom headers
/// - Request logging
/// - Error handling
///
/// The class uses Dio as the underlying HTTP client and includes interceptors for
/// logging request/response details during development.
///
/// Example usage:
/// ```dart
/// final client = BaseClientImpl();
///
/// // Make a GET request
/// final response = await client.getRequest(
///   path: '/users',
///   requiresAuthorization: true,
///   shouldCache: true
/// );
///
/// // Make a POST request with data
/// final response = await client.postRequest(
///   path: '/users',
///   data: {'name': 'John Doe'},
///   contentTypeIsMultiPart: false
/// );
/// ```
class BaseClientImpl extends BaseClient {
  /// The underlying Dio HTTP client instance used for making requests
  final Dio _dio;

  /// Creates a new BaseClientImpl instance and configures Dio with logging interceptors
  /// for development debugging purposes. The logger will show request headers and bodies
  /// as well as any errors that occur.
  BaseClientImpl() : _dio = Dio() {
    _dio.interceptors.add(
      PrettyDioLogger(
        error: true,
        requestBody: true,
        requestHeader: true,
        request: false,
        responseBody: false,
      ),
    );
  }

  /// Makes a GET request to the specified endpoint with optional caching support.
  ///
  /// If [shouldCache] is true and a network error occurs, attempts to return cached data.
  /// If [showDialog] is true, displays a loading indicator during the request.
  /// Automatically handles token refresh if an authorization error occurs.
  ///
  /// Parameters:
  /// - [baseUrl]: Optional base URL to prepend to the path
  /// - [optionalHeaders]: Additional headers to include in the request
  /// - [queryParameters]: URL query parameters
  /// - [path]: The API endpoint path
  /// - [showDialog]: Whether to show a loading dialog during the request
  /// - [shouldCache]: Whether to cache the response
  /// - [requiresAuthorization]: Whether the request requires authorization headers
  ///
  /// Returns the Response object or null if the request fails
  @override
  Future<Response<dynamic>?> getRequest({
    String baseUrl = "",
    Map<String, String>? optionalHeaders,
    Map<String, dynamic>? queryParameters,
    required String path,
    bool showDialog = false,
    bool shouldCache = true,
    bool requiresAuthorization = true,
  }) async {
    Response? response;
    // if (showDialog) showLoadingDialog();

    try {
      Map<String, String> header = await getHeader(
        requiresAuthorization: requiresAuthorization,
      );
      if (optionalHeaders != null) {
        header.addAll(optionalHeaders);
      }

      response = await _dio.get(
        baseUrl + path,
        queryParameters: queryParameters,
        options: Options(
          headers: header,
          sendTimeout: const Duration(seconds: 40),
          receiveTimeout: const Duration(seconds: 40),
        ),
      );
      debugPrint(baseUrl + path + response.statusCode.toString());
      if (shouldCache) {
        di<StorageService>().writeString(
          path,
          jsonEncode(response.data).toString(),
        );
      }
    } on DioException catch (e) {
      final responseAfterAuthError = await _handleAuthError(
        e,
        () => getRequest(
          baseUrl: baseUrl,
          optionalHeaders: optionalHeaders,
          queryParameters: queryParameters,
          path: path,
          showDialog: showDialog,
          shouldCache: shouldCache,
        ),
      );
      response = responseAfterAuthError;
      debugPrint("DioException getreq error @path$baseUrl $path: $e");
      if (shouldCache && e.error is SocketException) {
        response = await getCachedResponse(path);
      }
    } catch (e) {
      debugPrint("Catch error: $e");
      if (shouldCache && e is SocketException) {
        response = await getCachedResponse(path);
      }
    }
    // if (showDialog) hideLoadingDialog();
    return response;
  }

  /// Attempts to refresh the access token using the stored refresh token.
  ///
  /// Makes a POST request to the refresh token endpoint with the current refresh token.
  /// If successful, stores the new access and refresh tokens.
  ///
  /// Returns true if token refresh was successful, false otherwise.
  Future<bool> getNewAccessToken() async {
    try {
      final refreshToken = di<StorageService>().readString(
        StorageConstants.kRefreshToken,
      );
      Dio dio = Dio();
      PrintUtil.printLog(
        message: 'refresh token: $refreshToken',
        tag: 'getNewAccessToken',
      );
      PrintUtil.printLog(
        message:
            'URL: ${EnvironmentConstants.baseUrl + ApiConstants.refreshToken}',
        tag: 'RefreshTokenURL',
      );

      final response = await _dio.post(
        EnvironmentConstants.baseUrl + ApiConstants.refreshToken,
        data: {'refreshToken': refreshToken, 'grantType': 'refresh_token'},
        options: Options(
          sendTimeout: const Duration(seconds: 40),
          receiveTimeout: const Duration(seconds: 40),
          headers: {
            //can pass header here
          },
        ),
      );
      PrintUtil.printLog(
        message:
            'refresh token response: ${response.statusCode} - ${response.data}',
        tag: 'RefreshTokenResponse',
      );
      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        await di<StorageService>().writeString(
          StorageConstants.kAccessToken,
          data['data']['accessToken'] as String,
        );
        await di<StorageService>().writeString(
          StorageConstants.kRefreshToken,
          data['data']['refreshToken'] as String,
        );
        return true;
      } else {
        debugPrint(
          "Failed to refresh token: ${response.statusCode} - ${response.data}",
        );
        return false;
      }
    } on DioException catch (e) {
      debugPrint("DioException while refreshing token: ${e.message}");
      if (e.response != null) {
        debugPrint("Response data: ${e.response?.data}");
      }
      return false;
    } catch (e) {
      debugPrint("Unexpected error while refreshing token: $e");
      return false;
    }
  }

  /// Retrieves a cached response for the given endpoint from SharedPreferences.
  ///
  /// Creates a new Response object with the cached data if available.
  ///
  /// Parameters:
  /// - [endpoint]: The API endpoint path used as the cache key
  ///
  /// Returns the cached Response object or null if no cache exists
  Future<Response?> getCachedResponse(String endpoint) async {
    String? cachedResponse = await di<StorageService>().readString(endpoint);
    Response? response =
        cachedResponse != null
            ? Response(
              requestOptions: RequestOptions(),
              data: cachedResponse,
              statusCode: 200,
            )
            : null;
    return response;
  }

  /// Makes a POST request to the specified endpoint.
  ///
  /// Supports multipart form data and custom content types.
  /// Automatically handles token refresh if an authorization error occurs.
  ///
  /// Parameters:
  /// - [baseUrl]: Optional base URL to prepend to the path
  /// - [optionalHeaders]: Additional headers to include in the request
  /// - [queryParameters]: URL query parameters
  /// - [data]: The request body data
  /// - [path]: The API endpoint path
  /// - [showDialog]: Whether to show a loading dialog during the request
  /// - [contentTypeIsMultiPart]: Whether the content type is multipart/form-data
  /// - [requiresAuthorization]: Whether the request requires authorization headers
  /// - [setContentType]: Whether to set the Content-Type header
  ///
  /// Returns the Response object or null if the request fails
  @override
  Future<Response?> postRequest({
    String baseUrl = "",
    Map<String, String>? optionalHeaders,
    Map<String, dynamic>? queryParameters,
    dynamic data,
    required String path,
    bool showDialog = false,
    bool contentTypeIsMultiPart = false,
    bool requiresAuthorization = true,
    bool setContentType = true,
  }) async {
    Response? response;
    try {
      Map<String, String> header = await getHeader(
        contentTypeIsMultiPart: contentTypeIsMultiPart,
        setContentType: setContentType,
        requiresAuthorization: requiresAuthorization,
      );
      if (optionalHeaders != null) {
        header.addAll(optionalHeaders);
      }

      response = await _dio.post(
        baseUrl + path,
        queryParameters: queryParameters,
        options: Options(
          headers: header,
          sendTimeout: const Duration(seconds: 40),
          receiveTimeout: const Duration(seconds: 40),
        ),
        data: data,
      );

      debugPrint("post req resp $path : $response");
    } on DioException catch (e) {
      final responseAfterAuthError = await _handleAuthError(
        e,
        () => postRequest(
          baseUrl: baseUrl,
          optionalHeaders: optionalHeaders,
          queryParameters: queryParameters,
          data: data,
          path: path,
          showDialog: showDialog,
          contentTypeIsMultiPart: contentTypeIsMultiPart,
          requiresAuthorization: requiresAuthorization,
          setContentType: setContentType,
        ),
      );
      response = responseAfterAuthError;
      debugPrint("dio exp post req @path: $path : ${e.response}");
    } catch (e) {
      debugPrint("catch post req: $e");
    }
    // if (showDialog) hideLoadingDialog();
    return response;
  }

  /// Uploads an image file to the specified endpoint using multipart form data.
  ///
  /// Automatically sets the content type to multipart/form-data and includes
  /// the image file in the request body.
  ///
  /// Parameters:
  /// - [baseUrl]: Optional base URL to prepend to the path
  /// - [path]: The API endpoint path
  /// - [imageFile]: The image file to upload
  /// - [showDialog]: Whether to show a loading dialog during the upload
  /// - [requiresAuthorization]: Whether the request requires authorization headers
  /// - [optionalHeaders]: Additional headers to include in the request
  ///
  /// Returns the Response object or null if the upload fails
  @override
  Future<Response?> uploadImage({
    String baseUrl = "",
    required String path,
    required File imageFile,
    bool showDialog = false,
    bool requiresAuthorization = true,
    Map<String, String>? optionalHeaders,
  }) async {
    Response? response;
    try {
      String fileName = imageFile.path.split('/').last;
      FormData formData = FormData.fromMap({
        'avatar': await MultipartFile.fromFile(
          imageFile.path,
          filename: fileName,
        ),
      });

      Map<String, String> header = await getHeader(
        contentTypeIsMultiPart: true,
        requiresAuthorization: requiresAuthorization,
      );
      if (optionalHeaders != null) {
        header.addAll(optionalHeaders);
      }

      response = await _dio.post(
        baseUrl + path,
        data: formData,
        options: Options(
          headers: header,
          sendTimeout: const Duration(seconds: 40),
          receiveTimeout: const Duration(seconds: 40),
        ),
      );

      debugPrint("upload image resp: $response");
    } on DioException catch (e) {
      final responseAfterAuthError = await _handleAuthError(
        e,
        () => uploadImage(
          baseUrl: baseUrl,
          path: path,
          imageFile: imageFile,
          showDialog: showDialog,
          optionalHeaders: optionalHeaders,
        ),
      );
      response = responseAfterAuthError;
      debugPrint("dio exp upload image @path: $path : ${e.response}");
    } catch (e) {
      debugPrint("catch upload image: $e");
    }
    // if (showDialog) hideLoadingDialog();
    return response;
  }

  /// Makes a DELETE request to the specified endpoint.
  ///
  /// Automatically handles token refresh if an authorization error occurs.
  ///
  /// Parameters:
  /// - [baseUrl]: Optional base URL to prepend to the path
  /// - [optionalHeaders]: Additional headers to include in the request
  /// - [data]: The request body data
  /// - [path]: The API endpoint path
  /// - [showDialog]: Whether to show a loading dialog during the request
  /// - [requiresAuthorization]: Whether the request requires authorization headers
  ///
  /// Returns the Response object or null if the request fails
  @override
  Future<Response<dynamic>?> deleteRequest({
    String baseUrl = "",
    Map<String, String>? optionalHeaders,
    Map<String, dynamic>? data,
    required String path,
    bool showDialog = false,
    bool requiresAuthorization = true,
  }) async {
    Response? response;
    // if (showDialog) {
    //   showLoadingDialog();
    // }
    try {
      Map<String, String> header = await getHeader(
        requiresAuthorization: requiresAuthorization,
      );
      if (optionalHeaders != null) {
        header.addAll(optionalHeaders);
      }
      response = await _dio.delete(
        baseUrl + path,
        options: Options(
          headers: header,
          sendTimeout: const Duration(seconds: 40),
          receiveTimeout: const Duration(seconds: 40),
        ),
        data: data,
      );
      debugPrint("delete req resp: $response");
    } on DioException catch (e) {
      final responseAfterAuthError = await _handleAuthError(
        e,
        () => deleteRequest(
          baseUrl: baseUrl,
          optionalHeaders: optionalHeaders,
          data: data,
          path: path,
          showDialog: showDialog,
          requiresAuthorization: requiresAuthorization,
        ),
      );
      response = responseAfterAuthError;
      debugPrint("dio exp delete req @path: $path : ${e.response}");
    } catch (e) {
      debugPrint("catch delete req: $e");
    }
    // if (showDialog) hideLoadingDialog();
    return response;
  }

  /// Makes a PATCH request to the specified endpoint.
  ///
  /// Supports multipart form data and automatically handles token refresh
  /// if an authorization error occurs.
  ///
  /// Parameters:
  /// - [baseUrl]: Optional base URL to prepend to the path
  /// - [optionalHeaders]: Additional headers to include in the request
  /// - [data]: The request body data
  /// - [path]: The API endpoint path
  /// - [showDialog]: Whether to show a loading dialog during the request
  /// - [contentTypeIsMultiPart]: Whether the content type is multipart/form-data
  /// - [requiresAuthorization]: Whether the request requires authorization headers
  ///
  /// Returns the Response object or null if the request fails
  @override
  Future<Response<dynamic>?> patchRequest({
    String baseUrl = "",
    Map<String, String>? optionalHeaders,
    dynamic data,
    required String path,
    bool showDialog = false,
    bool contentTypeIsMultiPart = false,
    bool requiresAuthorization = true,
  }) async {
    Response? response;
    // if (showDialog) {
    //   showLoadingDialog();
    // }
    try {
      Map<String, String> header = await getHeader(
        contentTypeIsMultiPart: contentTypeIsMultiPart,
        setContentType: true,
        requiresAuthorization: requiresAuthorization,
      );
      if (optionalHeaders != null) {
        header.addAll(optionalHeaders);
      }
      response = await _dio.patch(
        baseUrl + path,
        options: Options(
          headers: header,
          sendTimeout: const Duration(seconds: 40),
          receiveTimeout: const Duration(seconds: 40),
        ),
        data: data,
      );
      debugPrint("patch req resp: $response");
    } on DioException catch (e) {
      final responseAfterAuthError = await _handleAuthError(
        e,
        () => patchRequest(
          baseUrl: baseUrl,
          optionalHeaders: optionalHeaders,
          data: data,
          path: path,
          showDialog: showDialog,
          contentTypeIsMultiPart: contentTypeIsMultiPart,
          requiresAuthorization: requiresAuthorization,
        ),
      );
      response = responseAfterAuthError;
      debugPrint("dio exp patch req @path: $path : ${e.response}");
    } catch (e) {
      debugPrint("catch patch req: $e");
    }
    // if (showDialog) hideLoadingDialog();
    return response;
  }

  /// Makes a PUT request to the specified endpoint.
  ///
  /// Automatically handles token refresh if an authorization error occurs.
  ///
  /// Parameters:
  /// - [baseUrl]: Optional base URL to prepend to the path
  /// - [optionalHeaders]: Additional headers to include in the request
  /// - [data]: The request body data
  /// - [path]: The API endpoint path
  /// - [showDialog]: Whether to show a loading dialog during the request
  /// - [requiresAuthorization]: Whether the request requires authorization headers
  ///
  /// Returns the Response object or null if the request fails
  Future<Response?> putRequest({
    String baseUrl = "",
    Map<String, String>? optionalHeaders,
    dynamic data,
    required String path,
    bool showDialog = false,
    bool requiresAuthorization = true,
  }) async {
    Response? response;
    try {
      Map<String, String> header = await getHeader(
        requiresAuthorization: requiresAuthorization,
        setContentType: true,
      );
      if (optionalHeaders != null) {
        header.addAll(optionalHeaders);
      }

      response = await _dio.put(
        baseUrl + path,
        options: Options(
          headers: header,
          sendTimeout: const Duration(seconds: 40),
          receiveTimeout: const Duration(seconds: 40),
        ),
        data: data,
      );

      debugPrint("put req resp: $response");
    } on DioException catch (e) {
      final responseAfterAuthError = await _handleAuthError(
        e,
        () => putRequest(
          baseUrl: baseUrl,
          optionalHeaders: optionalHeaders,
          data: data,
          path: path,
          showDialog: showDialog,
          requiresAuthorization: requiresAuthorization,
        ),
      );
      response = responseAfterAuthError;
      debugPrint("dio exp put req @path: $path : ${e.response}");
    } catch (e) {
      debugPrint("catch put req: $e");
    }
    // if (showDialog) hideLoadingDialog();
    return response;
  }

  /// Checks if a response indicates a token expiration error.
  ///
  /// Examines the response data structure for specific error messages
  /// that indicate an expired token.
  ///
  /// Returns true if the error is a token expiration error, false otherwise.
  bool _isTokenExpiredError(Response? response) {
    if (response?.data == null) return false;

    final errorData = response!.data;
    final errorTitle = errorData['error']?['title'];
    final firstErrorTitle = errorData['errors']?[0]?['title'];
    print("errorTitleInIsTokenExpiredError: $errorTitle ::: $firstErrorTitle");
    const validErrorMessages = ['User Unauthenticated'];

    return validErrorMessages.contains(errorTitle) ||
        validErrorMessages.contains(firstErrorTitle);
  }

  /// Extracts the error message from a response.
  ///
  /// Handles different error response structures and returns a trimmed error message.
  ///
  // /// Returns the error message string or null if no message is found.
  // String? _getErrorMessage(Response? response) {
  //   final errorData = response?.data;
  //   return errorData?['error']?['title'].toString().trim() ??
  //       errorData?['errors']?[0]?['title'].toString().trim();
  // }

  /// Handles authentication errors by attempting token refresh.
  ///
  /// If a 401 error occurs and it's due to token expiration:
  /// 1. Attempts to refresh the token
  /// 2. If successful, retries the original request
  /// 3. If unsuccessful, clears tokens and redirects to login
  ///
  /// Parameters:
  /// - [e]: The DioException that occurred
  /// - [retryRequest]: Callback function to retry the original request
  ///
  /// Returns the response from the retry attempt or the original error response
  Future<Response?> _handleAuthError(
    DioException e,
    Future<Response?> Function() retryRequest,
  ) async {
    if (e.response?.statusCode == 401) {
      if (!_isTokenExpiredError(e.response)) {
        return e.response;
      }

      if (await getNewAccessToken()) {
        return retryRequest();
      } else {
        await di<StorageService>().deleteString(StorageConstants.kAccessToken);
        await di<StorageService>().deleteString(StorageConstants.kRefreshToken);

        await Navigator.pushNamed(
          navigatorKey.currentContext!,
          AppRoutes.login,
          arguments: true,
        );
      }
    }
    return e.response;
  }
}
