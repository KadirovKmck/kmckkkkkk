import 'package:flutter/material.dart';
import 'package:kmckkkkkk/pages/fristPege.dart';

void main(List<String> args) {
  runApp(weater());
}

class weater extends StatelessWidget {
  const weater({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: firstPages(),
      // home: MyApp(),
    );
  }
}
