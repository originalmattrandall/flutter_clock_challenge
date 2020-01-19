import 'package:flutter/material.dart';

class ClockNumber extends StatelessWidget {
  const ClockNumber(
    {Key key, 
    this.value, 
    this.textStyle, 
    this.angle, 
    this.leftPosition, 
    this.topPosition, 
    this.opacity
  }) : super(key: key);

  final String value;
  final TextStyle textStyle;
  final double angle;
  final double leftPosition;
  final double topPosition;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: leftPosition,
      top: topPosition, 
      child: Transform.rotate(
        angle: angle,
        child: Opacity(
          opacity: opacity,
          child: Text(
            value,
            style: textStyle
          ),
        ),
      ),
    );
  }
}