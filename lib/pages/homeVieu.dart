import 'dart:convert';
import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:kmckkkkkk/pages/second_page.dart';

class HomeVieu extends StatefulWidget {
  const HomeVieu({super.key});

  @override
  State<HomeVieu> createState() => _HomeVieuState();
}

class _HomeVieuState extends State<HomeVieu> {
  String garada = '';
  double dus = 0;
  String countri = '';
  double temper = 0;
  // double countru = 0;
  // String temperatura = '';
  //  final random = math.Random().nextInt(6) + 1
  @override
  void initState() {
    showWeather();
    super.initState();
  }

  Future<void> showWeather() async {
    final position = await getPosition();
    WeatherAppMap(position);
    log('Position latitude ===> ${position.latitude}');
    log('Position longitude ===> ${position.longitude}');
  }

  WeatherAppMap(Position position) async {
    var client = http.Client();
    Uri uri = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=3a86e66bf53ada002d5efc51f8ef98b0');
    final DanyuJopp = await client.get(uri);
    // log('Danyu Joop ===> ${DanyuJopp.body}');
    final jsonJoop = jsonDecode(DanyuJopp.body);
    // log('json Joop ===> $jsonJoop.body');
    garada = jsonJoop['name'];
    // log('garada ====> $garada');
    dus = jsonJoop['main']['temp'];
    // log('dus ===> $jsonJoop');
    final kilvin = jsonJoop['main']['temp'];
    dus = kilvin - 275;
    countri = jsonJoop['sys']['country'];
    setState(() {});
  }

  Future<void> GaradaaApp({String? Gorod}) async {
    var client = http.Client();
    Uri uur = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$Gorod&appid=3a86e66bf53ada002d5efc51f8ef98b0');
    final DanyuJopp = await client.get(uur);
    // log('Danyu Joop ===> ${DanyuJopp.body}');
    final jsonJoop = jsonDecode(DanyuJopp.body);
    // log('json Joop ===> $jsonJoop.body');
    garada = jsonJoop['name'];
    // log('garada ====> $garada');
    dus = jsonJoop['main']['temp'];
    // log('dus ===> $jsonJoop');
    final kilvin = jsonJoop['main']['temp'];
    dus = kilvin - 275;
    countri = jsonJoop['sys']['country'];
    setState(() {});
  }

  Future<Position> getPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

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
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.location_city,
              size: 40,
            )),
        actions: [
          IconButton(
              onPressed: () async {
                var result = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SecondPage()));
                GaradaaApp(Gorod: result);
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
                image: AssetImage('images/kkkk.png'), fit: BoxFit.cover),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 700,
                left: 60,
                child: Text(
                  '${dus.toStringAsFixed(0)}',
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 30,
                child: Text(
                  '$countri',
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
                  garada,
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
              ),
            ],
          )),
    );
  }
}
