import 'package:dartz/dartz.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:intuji_infogrid/feature/auth/dummy_data/registered_user.dart';

Either<String, String> validateCredentials(String email, String password) {
  try {
    print('Attempting login with: $email, $password'); // Debug print
    print(
      'Registered users: ${registeredUser.map((u) => '${u.email}:${u.password}')}',
    ); // Debug print

    final user = registeredUser.firstWhere(
      (user) => user.email == email && user.password == password,
      orElse:
          () => throw Exception('User not found'), // More controlled exception
    );
    /*
    we normally dont create the token here, we will get it from the server
    */
    // Create JWT
    final jwt = JWT({
      'id': user.id,
      'email': user.email,
      'name': user.name,
    }, issuer: 'intuji_infogrid');

    // Sign it with a secret (in production, use environment variables)
    final token = jwt.sign(
      SecretKey('1234567890'),
      expiresIn: Duration(minutes: 20), // 20 minutes expiration
    );

    return Right(token);
  } catch (e) {
    print('Authentication failed: $e'); // Debug print
    return const Left('Invalid email or password');
  }
}

// Helper to verify token
bool isTokenValid(String token) {
  try {
    /* Verify the token with the secret key
    this is just for mock data, i have used it here directly
    in production we will use the environment variables or store it in secure way.

    we normally dont create the token here, we will get it from the server
    */
    JWT.verify(token, SecretKey('1234567890'));
    return true;
  } on JWTExpiredException {
    return false;
  } on JWTInvalidException {
    return false;
  } catch (e) {
    return false;
  }
}
