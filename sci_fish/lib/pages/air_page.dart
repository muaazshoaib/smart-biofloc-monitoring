import 'package:flutter/material.dart';
import 'package:sci_fish/constants.dart';

class AirPage extends StatefulWidget {
  const AirPage({Key? key}) : super(key: key);

  static const String id = 'air_page';

  @override
  State<AirPage> createState() => _AirPageState();
}

class _AirPageState extends State<AirPage> {

  bool switchSensor = false;
  String sensorStatus = 'Pump is OFF' ;
  Color statusColor = colorOff;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Air Flow'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5.0,
              ),
              Material(
                color: Colors.cyan[300],
                elevation: 4,
                borderRadius: BorderRadius.circular(10),
                shadowColor: Colors.blue,
                child: ListTile(
                    title: const Text(
                      'Air Pump ON/OFF',
                      style: TextStyle(
                        color: textColor,
                      ),
                    ),
                    trailing: const Icon(Icons.power_settings_new),
                    iconColor: statusColor,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Color(0xFF10898d), width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onTap: () {
                      setState(() {
                        if(switchSensor==true){
                          switchSensor = false;
                          sensorStatus = 'Pump is Off';
                          statusColor = colorOff;
                        }else{
                          switchSensor = true;
                          sensorStatus = 'Pump is On';
                          statusColor = colorOn;
                        }
                      });
                    }
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                child: Text(
                  sensorStatus,
                  style: TextStyle(
                    color: statusColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ListTile(
                title: const Text(
                  'Air Pump Status',
                  style: TextStyle(
                    color: textColor,
                  ),
                ),
                subtitle: const Text(
                  'OK',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: colorOn,
                    fontSize: 33.0,
                    //TODO: edit textsize according to expanded
                  ),
                ),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Color(0xFF10898d), width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              ListTile(
                title: const Text(
                  'Air Pressure',
                  style: TextStyle(
                    color: textColor,
                  ),
                ),
                subtitle: const Text(
                  '800Pa',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    // color: colorOn,
                    fontSize: 33.0,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Color(0xFF10898d), width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
