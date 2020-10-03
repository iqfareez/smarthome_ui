import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Random r = Random(); //assign isOn value randomly

class DeviceData {
  String name;
  IconData icon;
  bool isOn;

  DeviceData({this.name, this.icon, this.isOn});
}

class Devices {
  List<DeviceData> deviceDataList = [
    DeviceData(
        name: 'Heater', icon: FontAwesomeIcons.fireAlt, isOn: r.nextBool()),
    DeviceData(name: 'Sound', icon: FontAwesomeIcons.music, isOn: r.nextBool()),
    DeviceData(name: 'Fan', icon: FontAwesomeIcons.fan, isOn: r.nextBool()),
    DeviceData(
        name: 'Light', icon: FontAwesomeIcons.lightbulb, isOn: r.nextBool()),
    DeviceData(
        name: 'Door', icon: FontAwesomeIcons.doorOpen, isOn: r.nextBool())

    //add more / modify DeviceData() if you want to, this should be refelct automatically in the UI
  ];
}
