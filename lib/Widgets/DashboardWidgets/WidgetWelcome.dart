import 'package:flutter/material.dart';

class WidgetWelcome extends StatefulWidget {
  const WidgetWelcome({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  State<WidgetWelcome> createState() => _WidgetWelcome();
}

class _WidgetWelcome extends State<WidgetWelcome> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 19,bottom: 0),
      child: Text(
        "Bienvenue " + widget.name,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 19, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
