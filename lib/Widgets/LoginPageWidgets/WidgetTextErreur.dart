import 'package:flutter/material.dart';

//Texte d'erreur au cas où l'email et le mdp ne correspondent pas

WidgetTextErreur() {
  return Padding(
    padding: EdgeInsets.only(left:25, right:25, top: 10),
    child: Text(
      "L'email et le mot de passe ne correspondent pas, veuillez réessayer",
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 19, color: Colors.amber, fontWeight: FontWeight.bold),
    ),
  );
}
