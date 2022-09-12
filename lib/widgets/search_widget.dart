import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 5),
            height: 50,
            width: 300,
            child: TextFormField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search here ..."),
            ),
          ),
          const Icon(Icons.camera_alt),
        ],
      ),
    );
  }
}
