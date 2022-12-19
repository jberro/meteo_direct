import 'package:flutter/material.dart';

//Champs de saisie
class WidgetChamp extends StatefulWidget {

  const WidgetChamp({Key? key, required this.isMdp, required this.field}) : super(key: key);

  final bool isMdp;
  final TextEditingController field;

  @override
  State<WidgetChamp> createState() => _WidgetChampState();
  }

class _WidgetChampState extends State<WidgetChamp>{
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(33),
            child: TextFormField(
              //Style du cartouche
              obscureText: widget.isMdp,
              enableSuggestions: false,
              autocorrect: false,
              controller: widget.field,
              //assignation du bon controlleur
              //Vérification du champs non vide
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Champs vide';
                }
                return null;
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(33.0),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  hintStyle: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                  hintText: !widget.isMdp ? "Email" : "Mot de passe",
                  fillColor: Colors.white),
            )));
  }

}
