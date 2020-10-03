import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smarthome_ui/CONSTANTS.dart';
import 'package:smarthome_ui/database/room_data.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: ControlCenter(),
          ),
          Expanded(
            flex: 1,
            child: MusicPlayer(),
          ),
          Container(
            color: accentColour,
            height: 48,
          )
        ],
      ),
    );
  }
}

//TOP PROFILE HEADER

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

//POWER USAGE BANNER

class PowerUsageBanner extends StatelessWidget {
  final double baseRadius = 28.0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: paddingValue),
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
      ),
    );
  }
}

//BOTTOM MUSIC PLAYER

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
    Icon(Icons.pause, color: Colors.white, size: songIconSize),
    Icon(Icons.play_arrow, color: Colors.white, size: songIconSize)
  ];

  bool isPaused = true;
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30.0),
        topRight: Radius.circular(30.0),
      ),
      child: Container(
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
      ),
    );
  }
}

// CONTROL CENTER (BIG ORANGE BUTTON)

class ControlCenter extends StatelessWidget {
  final Room room = Room();
  final double axisSpacing = 26;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.all(axisSpacing),
      itemCount: room.roomDataList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: axisSpacing,
          mainAxisSpacing: axisSpacing),
      itemBuilder: (BuildContext context, int index) {
        return ControlCenterItem(
            icon: room.roomDataList[index].icon,
            title: room.roomDataList[index].title,
            numberOfDevices: room.roomDataList[index].numberOfDevices,
            isActive: room.roomDataList[index].isActive);
      },
    );
  }
}

class ControlCenterItem extends StatefulWidget {
  ControlCenterItem(
      {@required this.icon,
      @required this.title,
      @required this.numberOfDevices,
      @required this.isActive});

  final String title;
  final int numberOfDevices;
  final IconData icon;
  bool isActive;

  @override
  _ControlCenterItemState createState() => _ControlCenterItemState();
}

class _ControlCenterItemState extends State<ControlCenterItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.isActive = !widget.isActive;
          //toggle on / off of control center
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border:
              !widget.isActive ? Border.all(color: Colors.grey.shade300) : null,
          borderRadius: BorderRadius.circular(16),
          color: widget.isActive ? primaryColour : Colors.transparent,
        ),
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  // padding: EdgeInsets.all(18),
                  child: FaIcon(
                    widget.icon,
                    semanticLabel: widget.title,
                    size: 28,
                    color: widget.isActive ? Colors.white : primaryColour,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.title,
                  style: TextStyle(
                      color: widget.isActive ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  '${widget.numberOfDevices} device',
                  style: TextStyle(color: Colors.black.withAlpha(100)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
