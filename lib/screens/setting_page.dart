import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smarthome_ui/CONSTANTS.dart';
import 'package:smarthome_ui/Utils/launch_url_util.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListView(
                children: [
                  tapCard(
                    () {
                      LaunchUrlUtil.launchUrl('https://gum.co/SxEWQ');
                    },
                    ListTile(
                      leading:
                          FaIcon(FontAwesomeIcons.code, color: Colors.black),
                      title: Text(
                        'Get the source code',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Name your own price @ gum.co/SxEWQ'),
                    ),
                  ),
                  tapCard(
                    () {
                      LaunchUrlUtil.launchUrl('https://twitter.com/iqfareez2');
                    },
                    ListTile(
                      leading: FaIcon(
                        FontAwesomeIcons.twitter,
                        color: Color(0xFF1DA1F2),
                      ),
                      title: Text(
                        'Tweet tweet',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('twitter.com/iqfareez2'),
                    ),
                  ),
                  tapCard(
                    () {
                      LaunchUrlUtil.launchUrl(
                          'https://dribbble.com/shots/11317039-Smart-Home-App');
                    },
                    ListTile(
                      leading: FaIcon(FontAwesomeIcons.dribbble,
                          color: Color(0xFFEA4c89)),
                      title: Text(
                        'Inspiration',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle:
                          Text('dribbble.com/shots/11317039-Smart-Home-App'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset('images/undraw_source_code_xx2e.svg'),
              ),
            )
          ]),
    );
  }
}

Widget tapCard(Function _onTap, Widget _child) {
  return Card(
    child: InkWell(
      splashColor: accentColour.withAlpha(30),
      onTap: _onTap,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: _child,
      ),
    ),
  );
}
