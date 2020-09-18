import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smarthome_ui/CONSTANTS.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: ProfileHeader(),
            ),
            Expanded(
              flex: 1,
              child: PowerUsageBanner(),
            ),
            Expanded(
              flex: 3,
              child: Text('Switch 4'),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: accentColour,
                child: Text('Music Playinh'),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: CupertinoNavigationBar(),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: ListTile(
            title: Text(
              'Welcome home',
              style: TextStyle(color: Colors.grey),
            ),
            subtitle: Text(
              profileName,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 31),
            ),
            trailing: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'images/profileImage.jpg',
                fit: BoxFit.fill,
              ),
            )),
      ),
    );
  }
}

class PowerUsageBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListTile(
        leading: CircleAvatar(
          //this CircleAvatar is for border
          radius: 25,
          backgroundColor: Colors.grey.shade300,
          child: CircleAvatar(
            //This CircleAvatar is for icon
            radius: 24,
            backgroundColor:
                Colors.grey[50], //same as scaffold background colour,
            child: FaIcon(
              FontAwesomeIcons.bolt,
              color: Colors.black,
            ),
          ),
        ),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            Text(
              powerUsageText,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Text(
              ' Kwh',
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
        subtitle: Text(
          'Power usage for today',
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
