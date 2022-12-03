import 'package:flutter/material.dart';

class LoginFormField extends StatelessWidget {
  const LoginFormField({Key? key, required this.controller, required this.title, required this.obscureText, required this.textInputType,required this.visible}) : super(key: key);
  final TextEditingController controller;
  final String title;
  final bool obscureText;
  final TextInputType textInputType;
  final bool visible;
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
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          controller: controller,
          obscureText: obscureText,
          keyboardType: textInputType,
          decoration:  InputDecoration(

              hintText: title, border: InputBorder.none ,contentPadding: EdgeInsets.all(0),hintStyle: TextStyle(height:1)),
        ));
  }
}
