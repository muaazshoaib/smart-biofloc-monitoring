import 'package:flutter/material.dart';
import 'package:sci_fish/constants.dart';

class TemperaturePage extends StatefulWidget {
  const TemperaturePage({Key? key}) : super(key: key);

  static const String id = 'temperature_page';

  @override
  State<TemperaturePage> createState() => _TemperaturePageState();
}

class _TemperaturePageState extends State<TemperaturePage> {

  bool switchSensor = false;
  String sensorStatus = 'Sensor is OFF' ;
  Color statusColor = colorOff;

  String tempC = '_';
  String tempF = '_';

  void switchTemp(){
    setState(() {
      if(switchSensor==true){
        switchSensor = false;
        sensorStatus = 'Sensor is OFF';
        statusColor = colorOff;

        tempC = '_';
        tempF = '_';
      }else{
        switchSensor = true;
        sensorStatus = 'Sensor is ON';
        statusColor = colorOn;

        tempC = '33';
        tempF = '78';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temperature'),
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
                    'Temperature Sensor ON/OFF',
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
                    switchTemp();
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
              Expanded(
                flex: 1,
                child: ListTile(
                  title: const Text(
                    'Celsius Temperature',
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                  subtitle: Text(
                    '$tempC °C',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 33.0,
                      //TODO: edit textsize according to expanded
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Color(0xFF10898d), width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Expanded(
                flex: 1,
                child: ListTile(
                  title: const Text(
                    'Fahrenheit Temperature',
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                  subtitle: Text(
                    '$tempF °F',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 33.0,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Color(0xFF10898d), width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              const Text(
                'Temperature per Second:',
                style: TextStyle(
                  fontSize: 17.0,
                  color: textColor,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Container(
                    width: double.infinity,
                    color: Colors.white12,
                    child: const Center(
                      //TODO: Add graph in here
                      child: Text(
                        'Temperature Graph HERE',
                        style: TextStyle(
                          color: textColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}