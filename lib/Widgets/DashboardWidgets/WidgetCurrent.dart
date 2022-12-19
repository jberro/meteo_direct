import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meteo_direct/Models/Weather/weather_data_current.dart';

class WidgetCurrent extends StatefulWidget {
  final WeatherDataCurrent weatherDataCurrent;

  const WidgetCurrent({Key? key, required this.weatherDataCurrent})
      : super(key: key);

  @override
  State<WidgetCurrent> createState() => _WidgetCurrent();
}

class _WidgetCurrent extends State<WidgetCurrent> {
  String dateDay = DateTime.now().day.toString();
  String dateMonth = DateTime.now().month.toString();
  String dateYear = DateTime.now().year.toString();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 5),
        child: Column(children: [
          Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 99, right: 99, top: 10, bottom: 10),
                  child: Divider(
                    color: Colors.white,
                    thickness: 0.5,
                  )),
              //Nom de la ville
              Text(
                "Paris",
                style: TextStyle(
                    fontSize: 33,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              //Date
              Text(
                "le " + dateDay + "/" + dateMonth + "/" + dateYear,
                style: TextStyle(fontSize: 17, color: Colors.white),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Temperature actuelle
                  Text(
                    '${widget.weatherDataCurrent.current.temp!.toInt()}' + "°",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 88,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )),
              Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    //Icon correspondante à la description météo
                    ImageIcon(
                      AssetImage(
                          "assets/images/weather/${widget.weatherDataCurrent.current.weather![0].icon}.png"),
                      size: 120,
                      color: Colors.white.withOpacity(0.45),
                    ),
                    Text(
                      '${widget.weatherDataCurrent.current.weather![0].description}',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 21, color: Colors.white),
                    ),
                  ])),
            ],
          ),
          /*Padding(
              padding:
                  EdgeInsets.only(left: 99, right: 99, top: 20, bottom: 25),
              child: Divider(
                color: Colors.white,
                thickness: 0.5,
              ))*/
        ]));
  }
}
