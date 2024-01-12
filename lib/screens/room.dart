import 'package:flutter/material.dart';
import 'package:thermostat/thermostat.dart';

class RoomScreen extends StatefulWidget {
  final String cardTitle;

  const RoomScreen({super.key, required this.goBack, required this.cardTitle});

  final void Function() goBack;

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  var heatOn = false;
  var currentTemp = 20.0;
  var lightOn = false;
  var volume = 22.5;

  void setTemperature(double val) {
    setState(() {
      heatOn = val > 22;
      currentTemp = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: widget.goBack,
                      icon: const Icon(Icons.arrow_back),
                    ),
                    const VerticalDivider(
                      width: 20,
                      thickness: 5,
                      color: Colors.grey,
                    ),
                    Expanded(
                      child: Text(
                        widget.cardTitle,
                        textScaleFactor: 2.0,
                      ),
                    ),
                  ],
                )),
            const Divider(
              height: 20,
              thickness: 1,
              color: Colors.grey,
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(children: [
                        Icon(
                          Icons.water_drop,
                          size: 40,
                          color: Colors.blueGrey,
                        ),
                        Text('36%', textScaleFactor: 2),
                      ]),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(children: [
                        Icon(
                          Icons.co2_outlined,
                          size: 80,
                          color: Colors.blueGrey,
                        ),
                        Text(
                          '482ppm',
                          textScaleFactor: 2,
                        ),
                      ]),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              height: 20,
              thickness: 1,
              color: Colors.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Thermostat(
                      theme: ThermostatTheme.light(
                        glowColor: Colors.lightBlueAccent,
                        dividerColor: Colors.blue,
                        thumbColor: Colors.blue,
                      ),
                      turnOn: heatOn,
                      maxVal: 30,
                      minVal: 15,
                      curVal: 22,
                      setPoint: currentTemp,
                      setPointMode: SetPointMode.displayAndEdit,
                      onChanged: setTemperature),
                ),
              ],
            ),
            const Divider(
              height: 20,
              thickness: 1,
              color: Colors.grey,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Icon(
                      Icons.lightbulb,
                      size: 40,
                      color: lightOn ? Colors.amber : Colors.blueGrey,
                    ),
                    const Text('Valgus'),
                  ]),
                  Switch(
                    activeColor: Colors.amber,
                    value: lightOn,
                    onChanged: (bool value) {
                      setState(() {
                        lightOn = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            const Divider(
              height: 20,
              thickness: 1,
              color: Colors.grey,
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Row(children: [
                    Icon(
                      volume == 0 ? Icons.volume_off : Icons.volume_down,
                      size: 40,
                      color: Colors.blueGrey,
                    ),
                    const Text('TV'),
                  ]),
                  Expanded(
                    child: Slider(
                      value: volume,
                      max: 100,
                      divisions: 100,
                      label: volume.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          volume = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 20,
              thickness: 1,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
