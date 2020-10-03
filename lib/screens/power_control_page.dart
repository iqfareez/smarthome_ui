import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_slider/flutter_circular_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smarthome_ui/CONSTANTS.dart';
import 'package:smarthome_ui/database/device_data.dart';

class PowerControl extends StatefulWidget {
  PowerControl(this.title);
  final String title;

  @override
  _PowerControlState createState() => _PowerControlState();
}

class _PowerControlState extends State<PowerControl> {
  Devices _devices = Devices();
  Random r = Random();
  bool _switchValue = Random().nextBool();
  double temperature = 19.5;
  double currentTemperature = 19.5; //same as temperature initially
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        leading: IconButton(
          icon: FaIcon(
            FontAwesomeIcons.arrowLeft,
            color: accentColour,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          widget.title,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        // need 5 expanded widget
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: ListView.builder(
                itemCount: _devices.deviceDataList.length,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: kPagePadding),
                itemBuilder: (context, index) {
                  return DevicesSwitch(
                    parent: this,
                    devices: _devices,
                    index: index,
                    isActive: _devices.deviceDataList[index].isOn,
                    onPressed: () {
                      setState(() {
                        _devices.deviceDataList[index].isOn =
                            !_devices.deviceDataList[index].isOn;
                      });
                    },
                  );
                },
              ),
            ),
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.all(kPagePadding),
                child: SingleCircularSlider(
                  80, //division
                  20, //initial position
                  handlerColor: accentColour,
                  selectionColor: accentColour,
                  baseColor: Colors.grey.shade100,
                  showHandlerOutter: true, //didn't workk??
                  sliderStrokeWidth: 2,

                  showRoundedCapInSelection: true,
                  onSelectionChange: (init, end, laps) {
                    print('current: $end');
                    var newTemp = end.toDouble() / 5 + 0.5 + 15;
                    //convert slider to double, then divide it division, add decimal place, and since it counting from zero, add any number to become iniital value
                    print('temperature: $newTemp');
                    setState(() {
                      temperature = newTemp;
                    });
                  },
                  primarySectors: 4,
                  child: Container(
                    height: double.infinity,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: accentColour.withOpacity(0.31),
                            // spreadRadius: 20,
                            blurRadius: 50)
                      ],
                    ),
                    child: Center(
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: temperature.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 32),
                          ),
                          TextSpan(
                              text: ' °C',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 32))
                        ]),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kPagePadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Current temperature',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 5),
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: currentTemperature.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 24),
                            ),
                            TextSpan(
                                text: ' °C',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 24))
                          ]),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Current humidity',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '60%',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 24),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kPagePadding),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    children: [
                      Text(
                        'Turn On/Off',
                        style: TextStyle(color: Colors.grey),
                      ),
                      CupertinoSwitch(
                          activeColor: accentColour,
                          value: _switchValue,
                          onChanged: (value) {
                            setState(() {
                              _switchValue = value;
                            });
                          }),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 18, horizontal: kPagePadding),
                child: CupertinoButton(
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                    color: accentColour,
                    child: Text(
                      'Set temperature',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white),
                    ),
                    onPressed: () {
                      print("Temperarture set to $temperature");
                      setState(() {
                        currentTemperature = temperature;
                      });
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DevicesSwitch extends StatelessWidget {
  DevicesSwitch(
      {Key key,
      this.parent,
      @required Devices devices,
      @required this.index,
      this.isActive,
      this.onPressed})
      : _devices = devices,
        super(key: key);

  final Devices _devices;
  final _PowerControlState parent;
  final index;
  final onPressed;
  final isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(right: 20),
        height: double.infinity,
        width: 60,
        decoration: BoxDecoration(
          color: isActive ? primaryColour : Colors.white,
          shape: BoxShape.circle,
          border: Border.all(
              color: !isActive ? Colors.grey.shade300 : Colors.transparent),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: FaIcon(
                _devices.deviceDataList[index].icon,
                color: isActive ? Colors.white : Colors.black87,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                _devices.deviceDataList[index].name,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color:
                        isActive ? primaryColour : Colors.grey.withAlpha(200)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
