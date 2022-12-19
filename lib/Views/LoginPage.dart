import 'package:flutter/material.dart';
import 'package:meteo_direct/Controllers/global_controller.dart';
import 'package:get/get.dart';
import 'package:meteo_direct/Widgets/LoginPageWidgets/WidgetChamp.dart';
import 'package:meteo_direct/Widgets/LoginPageWidgets/WidgetLogo.dart';
import 'package:meteo_direct/Widgets/LoginPageWidgets/WidgetTextErreur.dart';

import 'DashboardPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Appel du controleur
  final GlobalController _globalController =
      Get.put(GlobalController(), permanent: true);

  //Controlleurs des champs de saisie
  TextEditingController emailField = TextEditingController();
  TextEditingController mdpField = TextEditingController();

  //Clé de validation du formulaire
  final _formKey = GlobalKey<FormState>();

  bool IncorrectLogin = false;
  bool isLoading = false;

  @override
  void dispose() {
    emailField.dispose();
    mdpField.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //Fond d'ecran dégradé
        body: Container(
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

            //Liste d'elements sur l'ecran
            child: Center(
                child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  //Logo de l'app
                  WidgetLogo(),
                  //Formulaire des champs de saisie
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //Champ de saisie pour email
                        WidgetChamp(isMdp: false, field: emailField),
                        //Champ de saisie pour mdp
                        WidgetChamp(isMdp: true, field: mdpField),
                        //Texte d'erreur au cas où l'email et le mdp ne correspondent pas
                        if (IncorrectLogin) WidgetTextErreur(),
                        //Bouton Login
                        WidgetBtnLogin(),
                      ],
                    ),
                  ),
                ],
              ),
            ))));
  }

//Widget bouton de connexion
  WidgetBtnLogin() {
    return Padding(
        padding: EdgeInsets.only(left: 25, right: 25, top: 40),
        child: ElevatedButton(
          onPressed: () {
            //Verification que les champs ne soient pas vides
            if (_formKey.currentState!.validate())
              checkUser(emailField.text, mdpField.text);
          },
          child: isLoading
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: Colors.white,
                    )
                  ],
                )
              : Text(
                  'Se connecter',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
          style: ElevatedButton.styleFrom(
            primary: _globalController.PrimaryColor,
            minimumSize: const Size.fromHeight(50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(33),
            ),
          ),
        ));
  }

//Fonction de vérification des champs saisie
  void checkUser(String emailFieldText, String mdpFieldText) {

    //On simule un chargement de 3 secondes pour vérifier le login
    setState(() {
      isLoading = true;
    });

    //Après les 3 secondes...
    Future.delayed(Duration(seconds: 3), () {

      //Vérification de l'email et du mdp
      if (emailFieldText == _globalController.user.Email &&
          mdpFieldText == _globalController.user.Mdp) {

        //Bon login => On se connecte
        setState(() {
          IncorrectLogin = false;

          //Vide les champs de saisie
          emailField.clear();
          mdpField.clear();

          //On passe sur l'ecran tableau de bord
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DashboardPage()),
          );
        });
      } else {
        //Mauvais login => On affiche le message d'erreur
        setState(() {
          IncorrectLogin = true;
        });
      }

      isLoading = false;
    });
  }
}
