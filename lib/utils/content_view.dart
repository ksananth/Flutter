import 'package:flutter/material.dart';
import 'package:my_app/widgets/custom_tab.dart';


class ContentView  {
  ContentView({required this.tab, required this.content});

  final CustomTab tab;
  final Widget content;
}