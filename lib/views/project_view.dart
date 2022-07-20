import 'package:flutter/material.dart';
import 'package:my_app/utils/view_wrapper.dart';

class ProjectView extends StatefulWidget {
  const ProjectView({required Key key}) : super(key: key);

  @override
  _ProjectViewState createState() => _ProjectViewState();
}

class _ProjectViewState extends State<ProjectView>
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
            'Project Desktop View',
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
            'Project Mobile View',
          ),
        ),
      ),
    );
  }
}
