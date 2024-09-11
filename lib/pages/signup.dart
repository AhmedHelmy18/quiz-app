import 'package:flutter/material.dart';
import '../component/customTextField.dart';
import '../component/error.dart';
import '../theme/theme.dart';

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
    return Scaffold(
      backgroundColor: Color(bgcolor),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Center(
              child: Text(
                'Quiz App',
                style: TextStyle(
                  fontSize: 35,
                  fontFamily: 'pacifico',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Sign up',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text('Create Your Account'),
            SizedBox(
              height: 30,
            ),
            error.length > 0
                ? Errorwidget(content: error)
                : SizedBox(height: 0),
            SizedBox(
              height: 28.0,
            ),
            Customtextfield(
              IsPassword: false,
              image: Icons.email,
              text: 'Email',
              controller: emailController,
            ),
            Customtextfield(
              IsPassword: true,
              image: Icons.password,
              text: 'Password',
              controller: passwordController,
            ),
            Customtextfield(
              IsPassword: true,
              image: Icons.password,
              text: 'Confirm Password',
              controller: confirmPasswordController,
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              width: 350,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(Buttoncolor),
                ),
                onPressed: () {},
                child: Text(
                  'Sign up',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already Have an Account?   ',
                  style: TextStyle(fontSize: 15),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(Buttoncolor),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
