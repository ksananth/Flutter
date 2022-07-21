import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
   const CustomTabBar(
      {required this.controller, required this.tabs});

  final TabController controller;
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double tabBarScaling = screenWidth > 1400
        ? 0.21
        : screenWidth > 1100
        ? 0.3
        : 0.4;
    return Padding(
      padding: EdgeInsets.only(right: screenWidth * 0.05, left: 20),
      child: SizedBox(
        width: screenWidth * tabBarScaling,
        child: Theme(
          data: ThemeData(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              hoverColor: Colors.black12),
          child: TabBar(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            controller: controller,
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Theme.of(context).secondaryHeaderColor,
            indicatorColor: Theme.of(context).primaryColor,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding:  const EdgeInsets.symmetric(horizontal: 5.0),
            labelStyle: TextStyle(fontSize: 11.0, color: Theme.of(context).secondaryHeaderColor),
            unselectedLabelStyle: TextStyle(fontSize: 10.0, color: Theme.of(context).primaryColor),
            tabs: tabs,
          ),
        ),
      ),
    );
  }
}