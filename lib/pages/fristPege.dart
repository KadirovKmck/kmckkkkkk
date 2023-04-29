import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:kmckkkkkk/pages/second_page.dart';

import 'homeVieu.dart';

class firstPages extends StatefulWidget {
  const firstPages({super.key});

  @override
  State<firstPages> createState() => _firstPagesState();
}

class _firstPagesState extends State<firstPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/hi.jpg'), fit: BoxFit.cover),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          DefaultTextStyle(
            style: const TextStyle(
              fontSize: 30.0,
            ),
            child: Center(
              child: AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText('Weather App'),
                ],
                isRepeatingAnimation: true,
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
