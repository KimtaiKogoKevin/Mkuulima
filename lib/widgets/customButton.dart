import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../utils/globalColors.dart';
class CustomButton extends StatefulWidget {
   CustomButton({Key? key, required this.text, required this.onPressed}) : super(key: key);
  final String text;
  final VoidCallback? onPressed;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    bool isEmail(String input) => EmailValidator.validate(input);

    bool isPhone(String input) =>
        RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
            .hasMatch(input);

    return InkWell(
      key: key,
      onTap:widget.onPressed,
      child: Container(
        alignment:Alignment.center,
        height:55,
        decoration:BoxDecoration(
          color:GlobalColors.mainColor,
          borderRadius:BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color:Colors.black.withOpacity(0.1),
              blurRadius:10
            ),
          ],
        ),
        child: Text(widget.text,style:const TextStyle(
          color:Colors.white,fontWeight:FontWeight.w600
        )),
      ),
    );
  }
}

