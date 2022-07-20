

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget{

  const CustomButton({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const Size(56, 56), // button width and height
      child: ClipRect(
        child: Material(
          color: Colors.orange, // button color
          child: InkWell(
            splashColor: Colors.green, // splash color
            onTap: () {}, // button pressed
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                Text(title, style: const TextStyle(fontSize: 16, color: Colors.blue)), // text
              ],
            ),
          ),
        ),
      ),
    );
  }
}
