import 'package:flutter/material.dart';
import 'package:meteo_direct/Models/Weather/weather_data_hourly.dart';
import 'package:intl/intl.dart';

class WidgetHourly extends StatefulWidget {
  final WeatherDataHourly weatherDataHourly;

  const WidgetHourly({Key? key, required this.weatherDataHourly})
      : super(key: key);

  @override
  State<WidgetHourly> createState() => _WidgetHourly();
}

class _WidgetHourly extends State<WidgetHourly> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(top: 13), child: hourlyList());
  }

  Widget hourlyList() {
    return Container(
        height: 110,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.weatherDataHourly.hourly.length > 12
                ? 12
                : widget.weatherDataHourly.hourly.length,
            itemBuilder: (context, index) {
              return Container(
                child: HourlyListItem(
                  temp: widget.weatherDataHourly.hourly[index].temp!,
                  time: widget.weatherDataHourly.hourly[index].dt!,
                  icon:
                      widget.weatherDataHourly.hourly[index].weather![0].icon!,
                ),
              );
              //return Obx(((() => GestureDetector(child: Container(decoration: BoxDecoration (color: Colors.white),child: Text("e"),)))));
            }));
  }
}

//Widget element de la liste
class HourlyListItem extends StatefulWidget {
  final double temp;
  final int time;
  final String icon;

  const HourlyListItem(
      {Key? key, required this.temp, required this.time, required this.icon})
      : super(key: key);

  //Fonction de conversion au format heure
  String getTime() {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(this.time*1000);
    String hourFormat = DateFormat('jm').format(dateTime);

    return hourFormat;
  }

  @override
  State<HourlyListItem> createState() => _HourlyListItem();
}

class _HourlyListItem extends State<HourlyListItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                widget.getTime(),
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              child:
                  Image.asset("assets/images/weather/" + widget.icon + ".png"),
              width: 33,
            ),
            Container(
              child: Text(
                widget.temp.toInt().toString() + "°",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ));
  }
}
