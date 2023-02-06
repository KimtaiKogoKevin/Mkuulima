import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../blocs/form-validation/form_bloc.dart';

OutlineInputBorder border = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black12, width: 3.0));

class LoginFormField extends StatefulWidget {
  const LoginFormField({
    Key? key,
    required this.controller,
    required this.title,
    required this.obscureText,
    required this.textInputType,
    required this.onChanged,
    required this.errorText,
    required this.labelText,
    this.helperText,
    this.hintText,
  }) : super(key: key);
  final TextEditingController controller;
  final String title;
  final bool obscureText;
  final TextInputType textInputType;
  final String? errorText;
  final String? labelText;
  final String? helperText;
  final String? hintText;

  final void Function(String?) onChanged;

  @override
  State<LoginFormField> createState() => _LoginFormFieldState();
}

class _LoginFormFieldState extends State<LoginFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        padding: const EdgeInsets.only(top: 3, left: 15),
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
        child: InkWell(
          onTap: (){
            setState(() {

            });
          },
          child: TextFormField(

              onChanged: widget.onChanged,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: widget.labelText,
                errorMaxLines:4,
                helperMaxLines:4,
                helperText: widget.helperText,
                errorText: widget.errorText,
                hintText: widget.hintText,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                border: border,
              )),
        ));

    // TextFormField(
    //   onChanged:(string)=>{controller.text},
    //
    //
    //   controller: controller,
    //   obscureText: obscureText,
    //   keyboardType: textInputType,
    //   decoration:  InputDecoration(
    //
    //       helperMaxLines: 2,
    //       labelText: 'Password',
    //       errorMaxLines: 2,
    //      errorText: errorText ,
    //
    //       hintText: title, border: InputBorder.none ,contentPadding: EdgeInsets.all(0),hintStyle: TextStyle(height:1)),
    // ));
  }
}
