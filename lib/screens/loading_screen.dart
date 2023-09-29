// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api, unused_import, unused_local_variable, avoid_print, use_build_context_synchronously, prefer_const_literals_to_create_immutables

import 'package:clima/screens/city_screen.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    WeatherModel weathermodel = WeatherModel();
    var weatherdata = await weathermodel.getlocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationweather: weatherdata,
      );
    }));
  }

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade400,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Weather App',
              style: kcitynametextstle,
            ),
            SizedBox(
              height: 20,
            ),
            Icon(
              Icons.sunny,
              size: 100,
              color: Colors.yellow,
            ),
            SizedBox(
              height: 100,
            ),
            SpinKitDoubleBounce(
              color: Colors.white70,
              size: 100.0,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Loading',
              style: kcitynametextstle,
            )
          ],
        ),
      ),
    );
  }
}
//079d60e69991c6f828016e9b1e372211

//'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apikey'