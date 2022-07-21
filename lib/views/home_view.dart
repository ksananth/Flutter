import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_app/utils/view_wrapper.dart';
import '../widgets/custom_button.dart';

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
    double imageSize = screenWidth * 0.4;
    double contentSize = screenWidth * 0.4;
    return Container(
        color: Colors.white,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 30),
              Container(
                  alignment: Alignment.center,
                  width: contentSize,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text: 'Hi, I\'m Ananth, a',
                                style: TextStyle(
                                    fontSize: 44, color: Colors.black)),
                            TextSpan(
                              text: ' Front End developer',
                              style: TextStyle(
                                  fontSize: 44,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                          "With industry experience in building Android and web applications. Specialize in Android & Kotlin",
                          style:
                              TextStyle(fontSize: 22, color: Colors.black38)),
                      SizedBox(height: 20),
                      CustomButton(
                          title: "Let's Talk", alignment: Alignment.centerRight)
                    ],
                  )),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.all(16),
                child: Container(
                    width: imageSize, child: Lottie.asset('assets/man.json')),
              ),
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
