import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_app/utils/view_wrapper.dart';
import '../widgets/custom_button.dart';
import '../widgets/orbit.dart';

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
    double imageSize = screenWidth * 0.35;
    double contentSize = screenWidth * 0.2;
    double imageHeight = screenHeight * 0.9;
    return Container(
        color: Theme.of(context).backgroundColor,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 20),
              Container(
                  alignment: Alignment.center,
                  width: contentSize,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5.0)),
                            color: Theme.of(context).primaryColor),
                        padding: const EdgeInsets.all(5.0),
                        child: const Text("Front-End Developer",
                            style: TextStyle(
                              fontFamily: 'Silka',
                              fontWeight: FontWeight.bold,
                              fontSize: 9,
                              color: Colors.black,
                            )),
                      ),
                      const SizedBox(height: 20),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text: 'HI THERE 👋, I\'M',
                                style: TextStyle(
                                    letterSpacing: 2.0,
                                    fontSize: 12,
                                    color: Theme.of(context)
                                        .secondaryHeaderColor)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text("ananth.",
                          style: TextStyle(
                              fontSize: 80,
                              color: Theme.of(context).secondaryHeaderColor)),
                      const SizedBox(height: 5),
                      const Text(
                          "I have industry experience in building Android and web applications. Specialize in Android & Kotlin",
                          style:
                              TextStyle(fontSize: 12, color: Colors.white24)),
                      const SizedBox(height: 30),
                      Text(
                        'Let\'s Talk!',
                        style: TextStyle(
                          fontSize: 12,
                          letterSpacing: 1.2,
                          color: Theme.of(context).primaryColor,
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.wavy,
                        ),
                      )
                    ],
                  )),
              const SizedBox(width: 10),
              Container(
                  padding: const EdgeInsets.all(32),
                  child: Stack(children: <Widget>[
                    Orbit(screenWidth: imageSize, screenHeight: imageHeight),
                    SizedBox(
                        width: imageSize,
                        child: Lottie.asset('assets/man.json')),
                  ])),
              const SizedBox(width: 20),
            ],
          ),
        ));
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
