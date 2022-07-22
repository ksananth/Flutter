import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Orbit extends StatefulWidget {
  @override
  _Orbit createState() => _Orbit();
}

class _Orbit extends State<Orbit> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this);

    controller.repeat(min: 0.0, max: 1.0, period: const Duration(seconds: 30));
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
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: Colors.green,
              ),
              height: 50.0,
              width: 50.0,
            ),
          ),
        ),
        Container(
          width: 215,
          height: 215,
          decoration: BoxDecoration(
              color: const Color(0xFF0C7D0D).withOpacity(0.2),
              borderRadius: const BorderRadius.all(Radius.circular(120))),
        ),
      ],
    );
  }
}
