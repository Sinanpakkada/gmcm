import 'package:flutter/material.dart';
import 'package:gmcm/screens/mobile_screen.dart';
import 'package:gmcm/screens/responsive.dart';
import 'package:gmcm/screens/web_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Responsive(mobileScreen: MobileScreen(), webScreen: WebScreen(),),
    );
  }
}

