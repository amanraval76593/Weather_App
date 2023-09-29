// ignore: non_constant_identifier_names
// ignore_for_file: unused_import, camel_case_types

import 'package:flutter/material.dart';

var popularcities = <String>['Mumbai', 'Delhi', 'Chennai', 'Banglore'];
var recentcities = <String>['', '', '', '', ''];
int count = 0;

class recentCity {
  void addcity(String newcity) {
    count++;
    recentcities.add(newcity);
  }

  void removecity(String oldcity) {
    recentcities.remove(oldcity);
  }
}
