import 'package:flutter/material.dart';
import '../component/customTextField.dart';
import '../component/error.dart';
import '../theme/theme.dart';
import 'home.dart';
import 'login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Signup extends StatefulWidget {
  Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String error = '';

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

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
            crossAxisAlignment: CrossAxisAlignment.center,
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
                'Sign up',
                style: TextStyle(
                  fontSize: deviceWidth * 0.1,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: deviceHeight * 0.01,
              ),
              Text('Create Your Account'),
              SizedBox(
                height: deviceHeight * 0.03,
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
              SizedBox(
                height: deviceHeight * 0.0001,
              ),
              Customtextfield(
                IsPassword: true,
                image: Icons.password,
                text: 'Password',
                controller: passwordController,
                name: TextInputType.text,
              ),
              SizedBox(
                height: deviceHeight * 0.0001,
              ),
              Customtextfield(
                IsPassword: true,
                image: Icons.password,
                text: 'Confirm Password',
                controller: confirmPasswordController,
                name: TextInputType.text,
              ),
              SizedBox(
                height: deviceHeight * 0.05,
              ),
              SizedBox(
                width: deviceWidth * 0.8,
                height: deviceHeight * 0.06,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(Buttoncolor),
                  ),
                  onPressed: () async {
                    if (emailController.text.isEmpty ||
                        passwordController.text.isEmpty ||
                        confirmPasswordController.text.isEmpty) {
                      setState(() {
                        error = 'Please fill in all fields.';
                      });
                    } else if (passwordController.text !=
                        confirmPasswordController.text) {
                      setState(() {
                        error = 'Passwords do not match.';
                      });
                    } else {
                      try {
                        final credential = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          setState(() {
                            error = 'The password provided is too weak.';
                          });
                        } else if (e.code == 'email-already-in-use') {
                          setState(() {
                            error =
                                'The account already exists for that email.';
                          });
                        }
                      } catch (e) {
                        error = e.toString();
                      }
                    }
                  },
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      fontSize: deviceWidth * 0.06,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: deviceHeight * 0.03,
              ),
              SizedBox(
                width: deviceWidth * 0.8,
                height: deviceHeight * 0.06,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(Buttoncolor),
                  ),
                  onPressed: () async {
                    try {
                      final GoogleSignInAccount? googleUser =
                          await GoogleSignIn().signIn();

                      if (googleUser == null) {
                        setState(() {
                          error = 'Google Sign-In was cancelled.';
                        });
                        return;
                      }

                      final GoogleSignInAuthentication? googleAuth =
                          await googleUser.authentication;

                      final credential = GoogleAuthProvider.credential(
                        accessToken: googleAuth?.accessToken,
                        idToken: googleAuth?.idToken,
                      );

                      await FirebaseAuth.instance
                          .signInWithCredential(credential);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    } catch (e) {
                      // setState(() {
                      //   error = e.toString();
                      // });
                      print(e);
                    }
                  },
                  child: Text(
                    'Sign up with Google',
                    style: TextStyle(
                      fontSize: deviceWidth * 0.06,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: deviceHeight * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already Have an Account?   ',
                    style: TextStyle(fontSize: deviceWidth * 0.04),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ),
                      );
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: deviceWidth * 0.045,
                        color: Color(Buttoncolor),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: deviceHeight * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
