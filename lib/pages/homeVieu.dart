import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kmckkkkkk/pages/second_page.dart';

class HomeVieu extends StatefulWidget {
  const HomeVieu({super.key});

  @override
  State<HomeVieu> createState() => _HomeVieuState();
}

class _HomeVieuState extends State<HomeVieu> {
  @override
  void initState() {
    showWeather();
    super.initState();
  }

  Future<void> showWeather() async {
    final position = await getPosition();
    log('Position latitude ===> ${position.latitude}');
    log('Position longitude ===> ${position.longitude}');
  }

  Future<Position> getPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.location_on,
              size: 40,
            )),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondPage(),
                  ),
                );
              },
              icon: Icon(
                Icons.map_sharp,
                size: 40,
              ))
        ],
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/hi.jpg'), fit: BoxFit.cover),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 700,
                left: 60,
                child: Text(
                  '6°C',
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
              ),
              Positioned(
                left: 135,
                bottom: 700,
                child: Text(
                  '🌤',
                  style: TextStyle(fontSize: 50, color: Colors.yellow),
                ),
              ),
              Positioned(
                right: 20,
                bottom: 20,
                child: Text(
                  '🏔️',
                  style: TextStyle(fontSize: 90, color: Colors.green),
                ),
              ),
              Positioned(
                right: 30,
                bottom: 600,
                child: Text(
                  'Youll ',
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
              ),
              Positioned(
                right: 60,
                bottom: 500,
                child: Text(
                  'naed',
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
              ),
              Positioned(
                right: 10,
                bottom: 500,
                child: Text(
                  '🧣',
                  style: TextStyle(fontSize: 50, color: Colors.red),
                ),
              ),
              Positioned(
                right: 10,
                bottom: 400,
                child: Text(
                  '🎮',
                  style: TextStyle(fontSize: 50, color: Colors.black),
                ),
              ),
              Positioned(
                right: 80,
                bottom: 400,
                child: Text(
                  'and',
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
              ),
              Positioned(
                right: 150,
                bottom: 20,
                child: Text(
                  'Osh',
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
              ),
            ],
          )),
    );
  }
}
