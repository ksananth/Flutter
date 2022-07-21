
import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget{

  const CustomTab({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
     return Tab(
      child:  Text(title, style:  TextStyle(fontSize: 12, color: Theme.of(context).primaryColor))
    );
  }
}