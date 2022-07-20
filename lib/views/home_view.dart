import 'package:flutter/material.dart';
import 'package:my_app/utils/view_wrapper.dart';

class HomeView extends StatefulWidget {

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late double screenWidth;
  late double screenHeight;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return ViewWrapper(
      desktopView: desktopView(),
      mobileView: mobileView(),
    );
  }

  Widget desktopView() {
    return Container(
      color: Colors.grey[300],
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.red[400],
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: const Text(
            'Home Desktop View',
          ),
        ),
      ),
    );
  }

  Widget mobileView() {
    return Container(
      color: Colors.grey[300],
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.red[400],
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: const Text(
            'Home Mobile View',
          ),
        ),
      ),
    );
  }
}
