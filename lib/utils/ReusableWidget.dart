import 'package:flutter/material.dart';
class ReusableWidget extends StatelessWidget {
  final String title, value;

  const ReusableWidget({Key? key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:20.0,vertical:5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style:     Theme
          .of(context)
          .textTheme
          .titleLarge),

          Text(
            value.toString(),
          style: Theme
        .of(context)
        .textTheme
        .titleLarge),

        ],
      ),
    );
  }
}
