import 'package:intuji_infogrid/core/imports/ui_imports.dart';

class LoginBaseScreen extends StatefulWidget {
  const LoginBaseScreen({super.key});

  @override
  State<LoginBaseScreen> createState() => _LoginBaseScreenState();
}

class _LoginBaseScreenState extends State<LoginBaseScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Login')));
  }
}
