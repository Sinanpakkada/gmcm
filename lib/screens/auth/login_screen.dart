import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gmcm/constants.dart';
import 'package:gmcm/methodes/auth_methodes.dart';
import 'package:gmcm/screens/auth/signup_screen.dart';
import 'package:gmcm/widgets/input_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SizedBox(
          width:isWeb?width/4:width/1.2,
          child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Login Page",style:TextStyle(fontSize:30),),
                      const SizedBox(height: 35,),
                      InputField(
                        hintText: "Email",
                        controller: _emailController,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      InputField(
                        hintText: "Password",
                        controller: _passwordController,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      ElevatedButton(onPressed: (){
                        if(_emailController.text.isEmpty||_passwordController.text.isEmpty){
                          showFlushBar(context, "error", "Email or Password cant be empty");
                        }
                        else{
                          _login(_emailController,_passwordController);
                        }
                      }, child: Text("Login"))
                    ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(height:10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Dont have an account?"),
                            TextButton(onPressed: () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>SignupScreen()));
                        },child:const Text("Signup")),
                          ],
                        ),
                        
                      ],
                    ),
              ],
            ),
                
          ),
                ),
        ),
      )
    );
  }
  void _login(String email,String password)async{
    setState(() {
      showFlushBar(context, "Wait", "Processing")
    });
    String result=await AuthMethods().loginuser(email:email,password:password);
    setState(() {
      if(result=="Success"){
        showFlushBar(context, result, "Succesfully logged in");
        Future.delayed(Duration(seconds: 2),(){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Homescreen()));
        });
      }
    });

  }
}