import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:firebase_auth/firebase_auth.dart';

bool isWeb=false;
bool isMobile=true;



void showFlushBar(BuildContext context,String topMessage,String bottomMessage){
  Flushbar(
    borderRadius:BorderRadius.circular(8),
    duration:Duration(seconds: 1),
    backgroundGradient:LinearGradient(
      colors:[Colors.blue.shade800,Colors.blueAccent.shade700],
      stops:[0.6,1],
    ),
    dismissDirection:FlushbarDismissDirection.HORIZONTAL,
    forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
    title: topMessage,
    message: bottomMessage,
  ).show(context);
}