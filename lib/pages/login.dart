import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/pages/home.dart';
import 'package:quiz_app/pages/signup.dart';
import '../component/customTextField.dart';
import '../component/error.dart';
import '../theme/theme.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String error = '';

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(bgcolor),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.1),
          child: Column(
            children: [
              SizedBox(
                height: deviceHeight * 0.05,
              ),
              Center(
                child: Text(
                  'Quiz App',
                  style: TextStyle(
                    fontSize: deviceWidth * 0.09,
                    fontFamily: 'pacifico',
                  ),
                ),
              ),
              SizedBox(
                height: deviceHeight * 0.02,
              ),
              Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: deviceWidth * 0.12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('Enter Your Credential to Login'),
              SizedBox(
                height: deviceHeight * 0.03, // 3% of device height
              ),
              if (error.isNotEmpty)
                Errorwidget(content: error)
              else
                SizedBox(height: deviceHeight * 0.03),
              Customtextfield(
                IsPassword: false,
                image: Icons.email,
                text: 'Email',
                controller: emailController,
                name: TextInputType.emailAddress,
              ),
              Customtextfield(
                IsPassword: true,
                image: Icons.password,
                text: 'Password',
                controller: passwordController,
                name: TextInputType.text,
              ),
              SizedBox(
                width: deviceWidth * 0.8,
                height: deviceHeight * 0.07,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(Buttoncolor),
                  ),
                  onPressed: () async {
                    try {
                      final credential = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        setState(
                          () {
                            error = 'No user found for that email.';
                          },
                        );
                      } else if (e.code == 'wrong-password') {
                        setState(
                          () {
                            error = 'Wrong password provided for that user.';
                          },
                        );
                      } else if (emailController.text.isEmpty ||
                          passwordController.text.isEmpty) {
                        setState(
                          () {
                            error = 'Please fill in all fields.';
                          },
                        );
                      }
                    }
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: deviceWidth * 0.05,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: deviceHeight * 0.1,
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Forget Password ?',
                  style: TextStyle(
                    color: Color(Buttoncolor),
                    fontSize: deviceWidth * 0.045,
                  ),
                ),
              ),
              SizedBox(
                height: deviceHeight * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't Have an Account?    ",
                    style: TextStyle(fontSize: deviceWidth * 0.04),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Signup(),
                        ),
                      );
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: deviceWidth * 0.045,
                        color: Color(Buttoncolor),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
