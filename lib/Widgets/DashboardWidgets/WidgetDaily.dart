import 'package:flutter/material.dart';
import 'package:meteo_direct/Models/Weather/weather_data_daily.dart';
import 'package:intl/intl.dart';

class WidgetDaily extends StatefulWidget {
  final WeatherDataDaily weatherDataDaily;

  const WidgetDaily({Key? key, required this.weatherDataDaily})
      : super(key: key);

  @override
  State<WidgetDaily> createState() => _WidgetDaily();
}

class _WidgetDaily extends State<WidgetDaily> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.only(left: 99, right: 99, top: 10, bottom: 10),
            child: Divider(
              color: Colors.white,
              thickness: 0.5,
            )),
        dailyList()
      ],
    );
  }

//Widget list
  Widget dailyList() {
    return Container(
        height: 300,
        child: ListView.builder(
            itemCount: widget.weatherDataDaily.daily.length > 6
                ? 6
                : widget.weatherDataDaily.daily.length,
            itemBuilder: (context, index) {
              return Container(
                child: DailyListItem(
                  temp: widget.weatherDataDaily.daily[index].temp!,
                  time: widget.weatherDataDaily.daily[index].dt!,
                  icon: widget.weatherDataDaily.daily[index].weather![0].icon!,
                  weather: widget
                      .weatherDataDaily.daily[index].weather![0].description!,
                ),
              );
              //return Obx(((() => GestureDetector(child: Container(decoration: BoxDecoration (color: Colors.white),child: Text("e"),)))));
            }));
  }
}

//Widget element de la liste
class DailyListItem extends StatefulWidget {
  final Temp temp;
  final int time;
  final String icon;
  final String weather;

  const DailyListItem(
      {Key? key,
      required this.temp,
      required this.time,
      required this.icon,
      required this.weather})
      : super(key: key);

  //Fonction de conversion au format jour
  String getDay() {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(this.time * 1000);
    String dayFormat = DateFormat('EEE').format(dateTime);

    return translateFrench(dayFormat);
  }

  //Fonction de conversion au format jour
  String getDayNumber() {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(this.time * 1000);
    String dayNumberFormat = DateFormat('d/M').format(dateTime);
    return dayNumberFormat;
  }

  @override
  State<DailyListItem> createState() => _DailyListItem();

  String translateFrench(String dayFormat) {
    switch(dayFormat){
      case "Mon": return "Lundi";
      case "Tue": return "Mardi";
      case "Wed": return "Mercredi";
      case "Thu": return "Jeudi";
      case "Fri": return "Vendredi";
      case "Sat": return "Samedi";
      case "Sun": return "Dimanche";

    }      return dayFormat;

  }
}

class _DailyListItem extends State<DailyListItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(child: DailyRowItemDay(widget)),
            Expanded(
                child: Container(
              alignment: Alignment.topCenter,
              child: Text(
                widget.temp.day!.toInt().toString() + "°",
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            )),
            Expanded(child: DailyRowItemWeather(widget)),
          ],
        ));
  }
}

Widget DailyRowItemDay(DailyListItem widget) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Text(
        widget.getDay(),
        style: TextStyle(
            color: Colors.white, fontSize: 21, fontWeight: FontWeight.bold),
      ),
      Text(
        widget.getDayNumber(),
        style: TextStyle(
            color: Colors.white, fontSize: 15),
      ),
    ],
  );
}

Widget DailyRowItemWeather(DailyListItem widget) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Container(
        child: Image.asset("assets/images/weather/" + widget.icon + ".png"),
        width: 33,
      ),
      Text(
        widget.weather,
        style: TextStyle(color: Colors.white),
      ),
    ],
  );
}
