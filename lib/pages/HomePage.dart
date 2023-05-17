import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Stopwatch stopwatch;
  late Timer t;

  void handleStartStop() {
    if (stopwatch.isRunning) {
      stopwatch.stop();
    } else {
      stopwatch.start();
    }
  }

  String returnFormattedText() {
    String milli =
        (stopwatch.elapsed.inMilliseconds % 1000).toString().padLeft(3, '0');

    String second =
        (stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, '0');
    var minute = (stopwatch.elapsed.inMinutes % 60).toString().padLeft(2, '0');
    var hours = stopwatch.elapsed.inHours;
    return "$hours:$minute:$second:$milli";
  }

  @override
  void initState() {
    super.initState();
    stopwatch = Stopwatch();

    t = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {
                handleStartStop();
              },
              child: Container(
                height: 250,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue, width: 4)),
                child: Text(
                  returnFormattedText(),
                  style: GoogleFonts.bebasNeue(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            CupertinoButton(
              child: Text(
                'Reset',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                stopwatch.reset();
              },
              padding: EdgeInsets.all(0),
            )
          ],
        ),
      )),
    );
  }
}
