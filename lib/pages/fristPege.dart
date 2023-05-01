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
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeVieu(),
              ),
            );
          },
          icon: Icon(
            Icons.location_on,
            size: 40,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/kkmck.jpg'), fit: BoxFit.cover),
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
          SizedBox(
            height: 25,
          ),
          Center(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 10),
                    TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.white),
                            borderRadius: BorderRadius.circular(12)),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 10,
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: "Enter your name",
                      ),
                    )
                  ],
                )),
          ),
          SizedBox(
            height: 15,
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: TextField(
                textAlign: TextAlign.center,
                autofocus: true,
                style: TextStyle(color: Colors.white, fontSize: 20),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(width: 3, color: Colors.white)),
                    prefixIcon: Icon(Icons.email),
                    hintText: 'Enter your email',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
        ]),
      ),
    );
  }
}
