import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RoomData {
  String title;
  int numberOfDevices;
  IconData icon;
  bool isActive;

  RoomData({this.icon, this.title, this.numberOfDevices, this.isActive});
}

class Room {
  List<RoomData> roomDataList = [
    RoomData(
        icon: FontAwesomeIcons.bath,
        title: 'Bathroom',
        numberOfDevices: 1,
        isActive: true),
    RoomData(
        icon: FontAwesomeIcons.tv,
        title: 'Living room',
        numberOfDevices: 4,
        isActive: false),
    RoomData(
        icon: FontAwesomeIcons.blender,
        title: 'Kitchen',
        numberOfDevices: 2,
        isActive: false),
    RoomData(
        icon: FontAwesomeIcons.utensils,
        title: 'Dining room',
        numberOfDevices: 3,
        isActive: false)

    //add more RoomData() if you want to. It should automoatically resize according to your time
  ];
}
