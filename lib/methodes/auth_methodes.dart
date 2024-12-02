import 'package:flutter/material.dart';
import 'package:gmcm/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods{
  Future<String> loginuser(
    {
      required String email,
      required String password,

    }
  )async
  {
    String result="Some error occured";
    try{
      await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      result="Success";
    }
    on FirebaseAuthException catch(e){
      result=e.message.toString();
    } 
    return result;
  }
  Future<String> SignUpUser({
    required String username,
    required String email,
    required String password,
  })async
  {
    String result="Some error occured";
    try{
      await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      result="Success";
    }
    on FirebaseAuthException catch(e){
      result=e.message.toString();
    }
    return result;
  }
}