import 'package:flutter/material.dart';
import 'package:my_app/utils/content_view.dart';
import 'package:my_app/utils/view_wrapper.dart';
import 'package:my_app/views/home_view.dart';
import 'package:my_app/widgets/Custom_tab_bar.dart';
import 'package:my_app/widgets/custom_tab.dart';
import 'package:my_app/views/about_view.dart';
import 'package:my_app/views/project_view.dart';

import 'utils/tab_controller_handler.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  late double screenHeight;
  late double screenWidth;
  late double topPadding;
  late double bottomPadding;
  late double sidePadding;

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
  void initState() {
    super.initState();
    tabController = TabController(length: contentViews.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    topPadding = screenHeight * 0.05;
    bottomPadding = screenHeight * 0.03;
    sidePadding = screenWidth * 0.05;

    print('Width: $screenWidth');
    print('Height: $screenHeight');

    return Scaffold(
      key: scaffoldKey,
      //endDrawer: drawer(),
      appBar: AppBar(
          elevation: 15,
          shadowColor: Colors.orangeAccent,
          title: const SizedBox(
            width: 40,
            child: Icon(Icons.sailing),
          ),
          centerTitle: false),
      body: Padding(
        padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
        child:
            ViewWrapper(desktopView: desktopView(), mobileView: mobileView()),
      ),
    );
  }

  Widget mobileView() {
    return Column(
      children: [
        Container(
          color: Colors.blueGrey,
          child: const Text("mobileView"),
        )
      ],
    );
  }

  Widget desktopView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children:  [
        SizedBox(
          height: screenHeight * 0.05,
          child: CustomTabBar(
              controller: tabController,
              tabs: contentViews.map((e) => e.tab).toList()),
        ),
        SizedBox(
          height: screenHeight * 0.8,
          child: TabControllerHandler(
            tabController: tabController,
            key: null,
            child: TabBarView(
              controller: tabController,
              children: contentViews.map((e) => e.content).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
