import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        onPrimary: Colors.black,
        animationDuration: const Duration(milliseconds: 700),
        primary: Colors.transparent,
        shadowColor: Colors.white54,
        side: const BorderSide(color: Colors.blueAccent),
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child:
      Text(title, style: const TextStyle(fontSize: 12, color: Colors.black26)), // text
    );
  }
}
