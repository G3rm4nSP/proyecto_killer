import 'package:flutter/material.dart';
import 'package:proyecto_killer/ui/menu/menu_page.dart';
import 'package:proyecto_killer/styles/button_style.dart';

ElevatedButton buttonLogIn(BuildContext context) {
  return ElevatedButton(
    style: buttonStyle(),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MenuPage()),
      );
    },
    child: Text("Iniciar Sesión", style: buttonTextStyle()),
  );
}

//button para utilizarlo en todas las pestañas que no sea muy llamativo y quede bien implementado con responsive
