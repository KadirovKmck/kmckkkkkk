import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
        backgroundColor: Colors.transparent,
        body: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeVieu(),
                ),
              );
            },
            icon: Icon(
              Icons.map_sharp,
              size: 40,
            )));
  }
}
