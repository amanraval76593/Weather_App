// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables, avoid_print

import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationweather});
  final locationweather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  int temperature = 0;
  int condition = 0;
  String cityname = '';
  String weathericon = '';
  String message = '';
  int feelLiketemp = 0;
  String descriptionData = '';
  int mintemp = 0;
  int maxtemp = 0;
  int pressure = 0;
  String groundlevel = '';
  int humidi = 0;
  int wind = 0;
  int cloudcover = 0;
  @override
  void initState() {
    super.initState();
    updateUI(widget.locationweather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weathericon = '';
        feelLiketemp = 0;
        message = 'Error in getting Data';
        return;
      }
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      weathericon = weather.getWeatherIcon(condition);
      message = weather.getMessage(temperature);
      var city = weatherData['name'];
      cityname = city.toString();
      double feelliketemperature = weatherData['main']['feels_like'];
      feelLiketemp = feelliketemperature.toInt();
      var descriptionDetail = weatherData['weather'][0]['description'];
      descriptionData = descriptionDetail.toString();
      double mintemperatue = weatherData['main']['temp_min'];
      mintemp = mintemperatue.toInt();
      double maxtemperatue = weatherData['main']['temp_max'];
      maxtemp = maxtemperatue.toInt();
      pressure = weatherData['main']['pressure'];
      // int grnlevel1 = weatherData['main']['grnd_level'];
      // groundlevel = grnlevel1.toString();
      // int humid = weatherData['main']['humidity'];
      // humidi = humid.toInt();
      double windspeed = weatherData['wind']['speed'];
      wind = windspeed.toInt();
      cloudcover = weatherData['clouds']['all'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bgimg.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherdata = await weather.getlocationWeather();
                      updateUI(weatherdata);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CityScreen();
                      }));
                      if (typedName != null) {
                        var weatherData =
                            await weather.getCityWeather(typedName);
                        updateUI(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.search,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Center(
                child: Text(
                  cityname,
                  style: kcitynametextstle,
                ),
              ),
              Center(
                child: Text(
                  weathericon,
                  style: kConditionTextStyle,
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            '$temperature°',
                            style: kTempTextStyle,
                          ),
                          Text(
                            'Feel like : $feelLiketemp°',
                            style: kMessageTextStyle,
                          )
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   width: 10,
                  // ),
                  Text(
                    descriptionData,
                    style: kdescriptiontextstle,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                //flex: 1,
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'min|max',
                                style: kdetailname,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '$mintemp|$maxtemp°',
                                style: kMessageTextStyle,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'Pressure',
                                style: kdetailname,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '$pressure mb',
                                style: kMessageTextStyle,
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'Ground level',
                                style: kdetailname,
                              ),
                              Text(
                                'null',
                                style: kMessageTextStyle,
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Humidity',
                                style: kdetailname,
                              ),
                              Text(
                                '$humidi%',
                                style: kMessageTextStyle,
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'Wind',
                                style: kdetailname,
                              ),
                              Text(
                                '$wind km/h',
                                style: kMessageTextStyle,
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'Cloud cover',
                                style: kdetailname,
                              ),
                              Text(
                                '$cloudcover %',
                                style: kMessageTextStyle,
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.only(right: 15.0),
              //   child: Text(
              //     "$message in $cityname",
              //     textAlign: TextAlign.right,
              //     style: kMessageTextStyle,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
//  var temperature = weatherData['main']['temp'];
//       print(temperature);
//       var condition = weatherData['weather'][0]['id'];
//       print(condition);
//       var city = weatherData['name'];
//       print(city);