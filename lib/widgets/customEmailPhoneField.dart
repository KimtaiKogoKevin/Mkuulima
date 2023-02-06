import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class EmailPhone extends HookWidget {
   EmailPhone({Key? key, required this.controller, required this.title, required this.obscureText, required this.textInputType}) : super(key: key);
  final TextEditingController controller;
  final String title;
  final bool obscureText;
  final TextInputType textInputType;
  // final emailPhoneKey = useState(GlobalKey<FormFieldState>());


  @override
  Widget build(BuildContext context) {
    bool isEmail(String input) => EmailValidator.validate(input);

    bool isPhone(String input) => RegExp(
        r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$'
    ).hasMatch(input);


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
          // key: emailPhoneKey.value,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }


            if (!isEmail(value) && !isPhone(value)) {
              return 'Please enter a valid email or phone number.';
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
