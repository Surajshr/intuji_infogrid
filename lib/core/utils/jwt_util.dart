import 'package:intuji_infogrid/feature/more/data/model/user_info_model.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class JwtUtils {
  static Map<String, dynamic>? decodeToken(String token) {
    try {
      // Remove 'Bearer ' prefix if present
      final cleanToken =
          token.startsWith('Bearer ') ? token.substring(7) : token;

      // Decode the token
      final decodedToken = JwtDecoder.decode(cleanToken);

      return decodedToken;
    } catch (e) {
      print('Error decoding token: $e');
      return null;
    }
  }

  static UserInfo? extractUserInfo(String token) {
    final decodedToken = decodeToken(token);
    if (decodedToken == null) return null;

    try {
      return UserInfo(
        id: decodedToken['sub'] ?? '',
        email: decodedToken['email'] ?? '',
        name: decodedToken['name'] ?? '',
        role: decodedToken['role'] ?? '',
        // Add other fields as needed based on your JWT payload
      );
    } catch (e) {
      print('Error extracting user info: $e');
      return null;
    }
  }
}
