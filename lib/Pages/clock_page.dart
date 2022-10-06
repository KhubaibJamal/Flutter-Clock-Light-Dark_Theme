import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/material.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

class ClockPage extends StatefulWidget {
  const ClockPage({Key? key}) : super(key: key);

  @override
  State<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DigitalClock(
              digitAnimationStyle: Curves.elasticInOut,
              is24HourTimeFormat: true,
              areaHeight: 150,
              areaDecoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              secondDigitDecoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              hourMinuteDigitDecoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              hourMinuteDigitTextStyle: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 70,
              ),
              // amPmDigitTextStyle: const TextStyle(
              //   color: Colors.pink,
              //   fontSize: 18,
              // ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            AnalogClock(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 500,
              decoration: BoxDecoration(
                color: Theme.of(context).secondaryHeaderColor,
                shape: BoxShape.circle,
              ),
              showDigitalClock: false,
              showTicks: false,
              showAllNumbers: true,
              showNumbers: false,
              useMilitaryTime: false,
            ),
          ],
        ),
      ),
    );
  }
}
