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
              child: MusicPlayer(),
            ),
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
      padding: const EdgeInsets.all(paddingValue),
      child: Center(
        child: ListTile(
          title: Text(
            'Welcome home',
            style: TextStyle(color: Colors.grey),
          ),
          subtitle: Text(
            profileName,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 31),
          ),
          trailing: ProfileImage(
            imageLocation: 'images/profileImage.jpg',
          ),
        ),
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key key, this.imageLocation}) : super(key: key);

  final String imageLocation;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.asset(
        imageLocation,
        fit: BoxFit.fill,
      ),
    );
  }
}

class PowerUsageBanner extends StatelessWidget {
  final double baseRadius = 28.0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(paddingValue),
      child: ListTile(
        leading: CircleAvatar(
          //this CircleAvatar is for border
          radius: baseRadius,
          backgroundColor: Colors.grey.shade300,
          child: CircleAvatar(
            //This CircleAvatar is for icon
            radius: baseRadius - 1,
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

class MusicPlayer extends StatefulWidget {
  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  List<FaIcon> favIcon = [
    FaIcon(FontAwesomeIcons.solidHeart,
        size: songIconSize, color: Colors.white),
    FaIcon(FontAwesomeIcons.heart, size: songIconSize, color: Colors.white),
  ];
  List<Icon> pauseIcon = [
    Icon(Icons.pause,
        color: Colors.white, size: songIconSize),
    Icon(Icons.play_arrow, color: Colors.white, size: songIconSize)
  ];

  bool isPaused = true;
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: accentColour,
      child: Padding(
        padding: const EdgeInsets.all(paddingValue),
        child: ListTile(
            title: Text(
              songTitle,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              songArtist,
              style: TextStyle(color: Colors.purple.shade300),
            ),
            leading: ProfileImage(
              imageLocation: 'images/albumArt.jpg',
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    icon: isFav ? favIcon[0] : favIcon[1],
                    onPressed: () {
                      setState(() {
                        isFav = !isFav;
                      });
                    }),
                SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isPaused = !isPaused;
                    });
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: primaryColour,
                    ),
                    child: isPaused ? pauseIcon[0] : pauseIcon[1],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
