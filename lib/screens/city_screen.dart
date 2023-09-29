// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api, avoid_print, use_build_context_synchronously, unused_local_variable, unused_import

import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:http/http.dart' as http;
import 'package:clima/utilities/cities.dart';

String cityName = '';
var popularcities = <String>['Mumbai', 'Delhi', 'Chennai', 'Hyderabad'];

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/bgimg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 50.0,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: TextField(
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: ktextFieldDecoration,
                    onChanged: (value) {
                      cityName = value;
                    },
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    http.Response response = await http.get(Uri.parse(
                        '$apiaddress?q=$cityName&appid=$apikey&units=metric'));
                    if (response.statusCode == 200) {
                     
                        recentCity().addcity(cityName);
                     

                      Navigator.pop(context, cityName);
                    } else {
                      Alert(
                        context: context,
                        title: "ERROR!",
                        desc: "Invalid City name.",
                        style:
                            AlertStyle(backgroundColor: Colors.pink.shade100),
                      ).show();
                    }
                  },
                  child: Text(
                    'Get Weather',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontFamily: 'Spartan MB',
                    ),
                  ),
                ),
                Text(
                  'Popular Cities',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontFamily: 'Spartan MB',
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  height: 150,
                  // color: Colors.black,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                onPressed: () async {
                                  http.Response response = await http.get(
                                    Uri.parse(
                                        '$apiaddress?q=${popularcities[0]}&appid=$apikey&units=metric'),
                                  );
                                  Navigator.pop(context, popularcities[0]);
                                },
                                child: Container(
                                  color: Colors.blue.shade100,
                                  child: Center(
                                      child: Text(
                                    popularcities[0],
                                    style: kpopularcitynametextstle,
                                  )),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: TextButton(
                                onPressed: () async {
                                  http.Response response = await http.get(
                                    Uri.parse(
                                        '$apiaddress?q=${popularcities[1]}&appid=$apikey&units=metric'),
                                  );
                                  Navigator.pop(context, popularcities[1]);
                                },
                                child: Container(
                                  color: Colors.blue.shade100,
                                  child: Center(
                                      child: Text(
                                    popularcities[1],
                                    style: kpopularcitynametextstle,
                                  )),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                onPressed: () async {
                                  http.Response response = await http.get(
                                    Uri.parse(
                                        '$apiaddress?q=${popularcities[2]}&appid=$apikey&units=metric'),
                                  );
                                  Navigator.pop(context, popularcities[2]);
                                },
                                child: Container(
                                  color: Colors.blue.shade100,
                                  child: Center(
                                      child: Text(
                                    popularcities[2],
                                    style: kpopularcitynametextstle,
                                  )),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: TextButton(
                                onPressed: () async {
                                  http.Response response = await http.get(
                                    Uri.parse(
                                        '$apiaddress?q=${popularcities[3]}&appid=$apikey&units=metric'),
                                  );
                                  Navigator.pop(context, popularcities[3]);
                                },
                                child: Container(
                                  color: Colors.blue.shade100,
                                  child: Center(
                                      child: Text(
                                    popularcities[3],
                                    style: kpopularcitynametextstle,
                                  )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
