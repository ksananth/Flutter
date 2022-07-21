import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({required this.title, required this.alignment});

  final String title;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 25),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            alignment: alignment,
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
          child: Text(title,
              style:
                   TextStyle(fontSize: 12, color: Theme.of(context).primaryColor)), // text
        ));
  }
}
