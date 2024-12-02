import 'package:flutter/material.dart';
import 'package:gmcm/screens/auth/login_screen.dart';
class WebScreen extends StatefulWidget {
  const WebScreen({super.key});

  @override
  State<WebScreen> createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {
  @override
  Widget build(BuildContext context) {
    return LoginScreen();
  }
}