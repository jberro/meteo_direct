import 'package:flutter/material.dart';
import 'package:meteo_direct/Controllers/global_controller.dart';
import 'package:get/get.dart';
import 'package:meteo_direct/Widgets/DashboardWidgets/WidgetCurrent.dart';
import 'package:meteo_direct/Widgets/DashboardWidgets/WidgetDaily.dart';
import 'package:meteo_direct/Widgets/DashboardWidgets/WidgetHourly.dart';
import 'package:meteo_direct/Widgets/DashboardWidgets/WidgetWelcome.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashBoardPage();
}

class _DashBoardPage extends State<DashboardPage> {
  //Appel du controleur
  final GlobalController _globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    _globalController.PrimaryColor,
                    _globalController.SecondaryColor
                  ],
                )),
                child: Obx(() => _globalController.checkLoading().isTrue
                    //Chargement en attente des données
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    //Affichage du tableau de bord avec les données
                    : SingleChildScrollView(
                        child: Column(children: <Widget>[
                        //Bienvenue "Nom de l'utilisateur"
                        WidgetWelcome(name: _globalController.user.Nom),
                        //Affichage de la température du jour
                        WidgetCurrent(
                            weatherDataCurrent: _globalController
                                .getWeatherData()
                                .getCurrentWeather()),
                        //Affichage de la température des prochaines heures
                        WidgetHourly(
                            weatherDataHourly: _globalController
                                .getWeatherData()
                                .getHourlyWeather()),
                        //Affichage de la température des prochains jours
                        WidgetDaily(
                            weatherDataDaily: _globalController
                                .getWeatherData()
                                .getDailyWeather())
                      ]))))));
  }
}
