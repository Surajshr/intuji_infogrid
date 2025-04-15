import 'package:flutter/material.dart';

class DashboardBaseScreen extends StatefulWidget {
  const DashboardBaseScreen({super.key});

  @override
  State<DashboardBaseScreen> createState() => _DashboardBaseScreenState();
}

class _DashboardBaseScreenState extends State<DashboardBaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Dashboard')));
  }
}
