import 'package:flutter/material.dart';

WidgetLogo() {
  return Padding(
    padding: const EdgeInsets.only(bottom: 45),
    child: Center(
      child: Container(
          width: 200,
          height: 150,
          child: Image.asset('assets/images/logo_app.png')),
    ),
  );
}