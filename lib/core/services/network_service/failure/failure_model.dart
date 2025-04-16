import 'package:intuji_infogrid/core/constants/string_constant.dart';
import 'package:intuji_infogrid/core/services/network_service/failure/field_errors_response_model.dart';

class Failure {
  /// Error messages thrown from backend logic part
  String? message;
  int? statusCode;
  String? title;

  /// Error messages thrown from form validators on backend side
  FieldErrorResponseModel? fieldErrors;

  Failure({this.message, this.statusCode, this.title});

  /* 
  Following json valus should be according to backend standard error response.
  following just a example how we can handle error response.
*/
  Failure.fromJson(Map<String, dynamic> json) {
    statusCode = json['errors']?[0]?['code'] as int?;
    title = json['errors']?[0]?['title'] as String?;
    final detail = json['errors']?[0]?['detail'] as String?;
    message = detail ?? StringConstants.defaultErrorMsg;
    fieldErrors =
        json.containsKey('errors')
            ? FieldErrorResponseModel.fromJson(json)
            : null;
  }

  /// FYI: Error message can either be in field errors or in the error field.
  /// So this method comes handy to pick a best fitting error message
  String getErrorMsg() =>
      fieldErrors?.errors?[0].message ??
      message ??
      StringConstants.defaultErrorMsg;
}
