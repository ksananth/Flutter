import 'package:flutter/material.dart';
import 'package:my_app/utils/content_view.dart';
import 'package:my_app/utils/view_wrapper.dart';
import 'package:my_app/views/home_view.dart';
import 'package:my_app/widgets/Custom_tab_bar.dart';
import 'package:my_app/widgets/custom_button.dart';
import 'package:my_app/widgets/custom_tab.dart';
import 'package:my_app/views/about_view.dart';
import 'package:my_app/views/project_view.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
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
  late ItemScrollController itemScrollController;
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
    itemScrollController = ItemScrollController();
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
      endDrawer: drawer(),
      body: ViewWrapper(desktopView: desktopView(), mobileView: mobileView()),
    );
  }

  Widget mobileView() {
    return Padding(
      padding: EdgeInsets.only(left: sidePadding, right: sidePadding),
      child: SizedBox(
        width: screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
                iconSize: screenWidth * 0.08,
                icon: const Icon(Icons.menu_rounded),
                color: Colors.black12,
                splashColor: Colors.transparent,
                onPressed: () => scaffoldKey.currentState?.openEndDrawer()),
            Expanded(
              child: ScrollablePositionedList.builder(
                scrollDirection: Axis.vertical,
                itemScrollController: itemScrollController,
                itemCount: contentViews.length,
                itemBuilder: (context, index) => contentViews[index].content,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget desktopView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
            height: screenHeight * 0.09,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              IconButton(
                  padding: const EdgeInsets.only(left: 20),
                  alignment: Alignment.centerLeft,
                  iconSize: 25,
                  icon: Image.asset('assets/logo.png'),
                  color: Colors.black12,
                  splashColor: Colors.transparent,
                  onPressed: () => {}),
              CustomTabBar(
                  controller: tabController,
                  tabs: contentViews.map((e) => e.tab).toList()),
              const CustomButton(title: "Resume", alignment: Alignment.centerRight)
            ])),
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

  Widget drawer() {
    return SizedBox(
      width: screenWidth * 0.5,
      child: Drawer(
        child: ListView(
          children: [Container(height: screenHeight * 0.1)] +
              contentViews
                  .map((e) => Container(
                        child: ListTile(
                          title: Text(
                            e.tab.title,
                            style: Theme.of(context).textTheme.button,
                          ),
                          onTap: () {
                            itemScrollController.scrollTo(
                                index: contentViews.indexOf(e),
                                duration: const Duration(milliseconds: 300));
                            Navigator.pop(context);
                          },
                        ),
                      ))
                  .toList(),
        ),
      ),
    );
  }
}
