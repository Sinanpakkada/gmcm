
import 'package:flutter/material.dart';
import 'package:gmcm/constants.dart';
import 'package:gmcm/methodes/auth_methodes.dart';
import 'package:gmcm/screens/auth/signup_screen.dart';
import 'package:gmcm/screens/home_screen.dart';
import 'package:gmcm/widgets/input_field.dart';
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
                      ElevatedButton(
  onPressed: () {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      showFlushBar(context, "Error", "Email or Password can't be empty");
    } else {
      _login(_emailController.text, _passwordController.text);
    }
  },
  child: const Text("Login"),
),
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
  void _login(String email, String password) async {
  setState(() {
    showFlushBar(context, "Wait", "Processing");
  });

  // Call the login method
  String result = await AuthMethods().loginuser(email: email, password: password);

  // Process the result
  if (result == "Success") {
    setState(() {
      showFlushBar(context, "Success", "Successfully logged in");
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