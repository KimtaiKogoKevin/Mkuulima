import 'package:flutter/material.dart';

import '../utils/globalColors.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){},
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
        child: Text(text,style:const TextStyle(
          color:Colors.white,fontWeight:FontWeight.w600
        )),
      ),
    );
  }
}

