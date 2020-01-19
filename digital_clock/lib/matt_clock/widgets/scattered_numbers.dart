import 'dart:math';
import 'package:flutter/material.dart';
import 'package:digital_clock/matt_clock/widgets/clock_number.dart';

class ScatteredNumbers extends StatelessWidget {

  const ScatteredNumbers({
    Key key, 
    this.currentTime,
    this.isMinutes = false
  }) : super(key: key);

  final String currentTime;
  final bool isMinutes;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        // color: Colors.pink,
        child: Stack(
          overflow: Overflow.visible,
          alignment: Alignment.center,
          children: createClockNumbers()
        ),
      ),
    );
  }

  List<Widget> createClockNumbers(){

    List<Widget> widgets = new List<Widget>();
    var maxInt = isMinutes ? 59 : 12;

    // TODO: change hard coded 12 based on 12 or 24 clock time
    // TODO: Should make sure each number is only used once
    for(var i = 0; i < 12; i++){

      var randomInt = int.parse(currentTime);

      // Make sure the current time does not exist in the background numbers
      while(randomInt == int.parse(currentTime)){
        randomInt = new Random().nextInt(maxInt);
      }

      widgets.add(ClockNumber(
        angle: getRandomDouble(-0.70, 0.70),
        leftPosition: getRandomDouble(20, 260.0),
        topPosition: getRandomDouble(30, 300.0),
        value: randomInt.toString().padLeft(2, '0'),
        opacity: 0.1,
        textStyle: TextStyle(
            fontSize: 42,
            fontFamily: 'Anton'
          ),
        ),
      );
    }

    widgets.add(ClockNumber(
      angle: getRandomDouble(-0.70, 0.70),
      leftPosition: getRandomDouble(30, 220.0),
      topPosition: getRandomDouble(30, 280.0),
      value: currentTime,
      opacity: 1,
      textStyle: TextStyle(
          fontSize: 82,
          color: Colors.blue,
          fontFamily: 'Anton'
        ),
      ),
    );

    return widgets;
  }

  double getRandomDouble(double min, double max){
    var randomX = new Random();
    return randomX.nextDouble() * (max - min) + min;
  }
}