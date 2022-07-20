import 'package:flutter/material.dart';
import 'package:my_app/utils/content_view.dart';
import 'package:my_app/views/home_view.dart';
import 'package:my_app/widgets/custom_tab.dart';
import 'package:my_app/views/about_view.dart';
import 'package:my_app/views/project_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late TabController tabController;

  List<ContentView> contentViews = [
    ContentView(
      tab: const CustomTab(title: 'Home'),
      content: HomeView(),
    ),
    ContentView(
      tab: const CustomTab(title: 'About'),
      content: AboutView(),
    ),
    ContentView(
      tab: const CustomTab(title: 'Projects'),
      content: ProjectView(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 15,
          shadowColor: Colors.orangeAccent,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const SizedBox(
            width: 40,
            child: Icon(Icons.sailing),
          ),
          centerTitle: false),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Home Screen',
            ),
          ],
        ),
      ),
    );
  }
}
