import 'package:flutter/material.dart';
import 'package:gmcm/screens/auth/login_screen.dart';
import 'package:gmcm/screens/auth/signup_screen.dart';
import 'package:gmcm/widgets/input_field.dart';
class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  @override
  Widget build(BuildContext context) {
    return SignupScreen();
  }
}