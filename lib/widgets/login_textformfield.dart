import 'package:flutter/material.dart';

class LoginFormField extends StatelessWidget {
  const LoginFormField({Key? key, required this.controller, required this.title, required this.obscureText}) : super(key: key);
  final TextEditingController controller;
  final String title;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        padding:const EdgeInsets.only(top:3,left:15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 7,
            ),
          ],
        ),
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          decoration:  InputDecoration(
              hintText: title, border: InputBorder.none ,contentPadding: EdgeInsets.all(0),hintStyle: TextStyle(height:1)),
        ));
  }
}
