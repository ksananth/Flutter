import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Orbit extends StatefulWidget {
  Orbit({Key? key, required this.screenWidth, required this.screenHeight})
      : super(key: key);
  late double screenWidth;
  late double screenHeight;

  @override
  _Orbit createState() => _Orbit(screenWidth, screenHeight);
}

class _Orbit extends State<Orbit> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late double screenWidth;
  late double screenHeight;

  _Orbit(this.screenWidth, this.screenHeight);

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this);

    controller.repeat(min: 0.0, max: 1.0, period: const Duration(seconds: 80));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        RotationTransition(
          turns: controller,
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  color: HexColor("#25262a")),
              height: 50.0,
              width: 50.0,
              child: IconButton(
                  icon: Image.asset('assets/ic_android.png'),
                  iconSize: 20,
                  onPressed: () {}),
            ),
          ),
        ),
        RotationTransition(
          turns: controller,
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  color: HexColor("#25262a")),
              height: 100.0,
              width: 100.0,
              child: IconButton(
                  icon: Image.asset('assets/ic_android.png'),
                  iconSize: 20,
                  onPressed: () {}),
            ),
          ),
        ),
        Container(
            width: screenWidth,
            height: screenHeight,
            child: SizedBox(
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xFF0C7D0D).withOpacity(0.2),
                    borderRadius: const BorderRadius.all(Radius.circular(120))),
              ),
            )),
      ],
    );
  }
}
