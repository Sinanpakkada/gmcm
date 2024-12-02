import 'package:flutter/material.dart';
import 'package:gmcm/constants.dart';
import 'package:gmcm/methodes/auth_methodes.dart';
import 'package:gmcm/screens/auth/login_screen.dart';
import 'package:gmcm/screens/home_screen.dart';
import 'package:gmcm/widgets/input_field.dart';
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  final TextEditingController _usernameController=TextEditingController();
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Signup Page",style:TextStyle(fontSize:30),),
                      const SizedBox(height: 35,),
                      InputField(
                        hintText: "Username",
                        controller: _emailController,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
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
                        if(_emailController.text.isEmpty||_passwordController.text.isEmpty||_usernameController.text.isEmpty){
                          showFlushBar(context,"error","email,username or password can't be empty");
                        }
                        else{
                          _signUp(_usernameController.text,_emailController.text,_passwordController.text);
                        }
                      }, child: const Text("Signup"))
                    ]),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already an user ?"),
                        TextButton(onPressed: () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginScreen()));
                        },child:const Text("Login")),
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
  void _signUp(String email,String password,String username)async{
    setState(() {
    showFlushBar(context, "Wait", "Processing");
  });
  String result = await AuthMethods().SignUpUser(email: email, password: password, username: username);

  // Process the result
  if (result == "Success") {
    setState(() {
      showFlushBar(context, "Success", "Successfully signed up");
    });

    // Navigate to the home screen
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Homescreen()), // Ensure Homescreen is defined
      );
    });
  } else {
    setState(() {
      // Show error message
      showFlushBar(context, "Error", result);
    });
  }
  }
}