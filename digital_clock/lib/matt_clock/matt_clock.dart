// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// License was left in as some of this code was original written by the team setting up the challenge

// TODO: Going forward maybe some animations could be added to liven this up.
// - All the background numbers could slightly flash randomly?
// - Maybe they could float around?

import 'dart:async';
import 'package:flutter_clock_helper/model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:digital_clock/matt_clock/widgets/scattered_numbers.dart';

/// Digital cock made by Matthew Randall for the Flutter Clock Challenge
class MattClock extends StatefulWidget {
  const MattClock(this.model);

  final ClockModel model;

  @override
  _MattClockState createState() => _MattClockState();
}

class _MattClockState extends State<MattClock> {
  DateTime _dateTime = DateTime.now();
  Timer _timer;

  @override
  void initState() {
    super.initState();
    widget.model.addListener(_updateModel);
    _updateTime();
    _updateModel();
  }

  @override
  void didUpdateWidget(MattClock oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.model != oldWidget.model) {
      oldWidget.model.removeListener(_updateModel);
      widget.model.addListener(_updateModel);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    widget.model.removeListener(_updateModel);
    widget.model.dispose();
    super.dispose();
  }

  void _updateModel() {
    setState(() {
      // Cause the clock to rebuild when the model changes.
    });
  }

  void _updateTime() {
    setState(() {
      _dateTime = DateTime.now();
      // Update once per minute. If you want to update every second, use the
      // following code.
      _timer = Timer(
        Duration(minutes: 1) -
            Duration(seconds: _dateTime.second) -
            Duration(milliseconds: _dateTime.millisecond),
        _updateTime,
      );
      // Update once per second, but make sure to do it at the beginning of each
      // new second, so that the clock is accurate.
      // _timer = Timer(
      //   Duration(seconds: 1) - Duration(milliseconds: _dateTime.millisecond),
      //   _updateTime,
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    final hour =
        DateFormat(widget.model.is24HourFormat ? 'HH' : 'hh').format(_dateTime);
    final minute = DateFormat('mm').format(_dateTime);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ScatteredNumbers(
          currentTime: hour,
        ),
        Text(
          ":",
          style: TextStyle(
            fontSize: 86,
            color: Colors.blue,
            fontFamily: 'Anton',
          ),
        ),
        ScatteredNumbers(
          currentTime: minute,
          isMinutes: true,
        ),
      ],
    );
  }
}
