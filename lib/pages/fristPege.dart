import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

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
              image: AssetImage('assets/images/kkmck.jpg'), fit: BoxFit.cover),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          DefaultTextStyle(
            style: const TextStyle(
              fontSize: 50.0,
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
            height: 40,
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
            height: 45,
          ),
          Container(
            height: 45,
            width: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.blue),
            child: TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeVieu()));
              },
              child: Text(
                'Register',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
