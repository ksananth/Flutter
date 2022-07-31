import 'package:flutter/material.dart';

class RollingCircle extends StatefulWidget {
  final double height;
  final int duration;

   RollingCircle({ Key? key, required this.height, this.duration = 1100}) : super(key: key);
  @override
  _RollingCircleState createState() => _RollingCircleState();
}

class _RollingCircleState extends State<RollingCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: widget.duration),
      vsync: this,
    )..repeat();
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
        turns: _animation,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: widget.height,
              width: widget.height,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Color(0xFFF65000), width: 1),
              ),
            ),
            Positioned(
              top: -4,
              left: 0,
              right: 0,
              child: Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFF65000),
                ),
              ),
            ),
          ],
        )
    );
  }
}