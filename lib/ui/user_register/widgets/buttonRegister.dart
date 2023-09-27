import 'package:flutter/material.dart';
import 'package:proyecto_killer/styles/button_style.dart';
import 'package:proyecto_killer/ui/user_logIn/user_logIn_page.dart';

ElevatedButton buttonRegiser(BuildContext context) {
  return ElevatedButton(
    style: buttonStyle(),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const UserLogIn()),
      );
    },
    child: Text("Registrarme", style: buttonTextStyle()),
  );
}
