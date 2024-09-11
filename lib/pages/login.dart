import 'package:flutter/material.dart';
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
                image: Icons.person,
                text: 'UserName',
                controller: emailController,
              ),
              Customtextfield(
                IsPassword: true,
                image: Icons.password,
                text: 'Password',
                controller: passwordController,
              ),
              SizedBox(
                width: deviceWidth * 0.8,
                height: deviceHeight * 0.07,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(Buttoncolor),
                  ),
                  onPressed: () {},
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
                      Navigator.pop(context);
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
