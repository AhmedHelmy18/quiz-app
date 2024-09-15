import 'package:flutter/material.dart';
import '../theme/theme.dart';

class Customtextfield extends StatefulWidget {
  Customtextfield({
    required this.name,
    required this.IsPassword,
    required this.image,
    required this.text,
    required this.controller,
  });

  TextInputType name;
  String text;
  IconData image;

  bool IsPassword = true;
  TextEditingController controller;

  @override
  State<Customtextfield> createState() => _CustomtextfieldState();
}

class _CustomtextfieldState extends State<Customtextfield> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: deviceHeight * 0.01, horizontal: deviceWidth * 0.001),
      child: TextField(
        controller: widget.controller,
        keyboardType: TextInputType.name,
        obscureText: widget.IsPassword && _isObscure,
        decoration: InputDecoration(
          focusColor: Color(Secondarycolor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          fillColor: Color(Secondarycolor),
          // Set your desired background color here
          filled: true,
          // This needs to be true to apply the background color,
          prefixIcon: Icon(
            widget.image,
            size: deviceWidth * 0.07,
          ),
          label: Text(
            widget.text,
            style: TextStyle(
              fontSize: deviceWidth * 0.045,
            ),
          ),
          suffixIcon: widget.IsPassword
              ? IconButton(
                  icon: Icon(
                    _isObscure ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(
                      () {
                        _isObscure = !_isObscure;
                      },
                    );
                  },
                )
              : null,
        ),
      ),
    );
  }
}
