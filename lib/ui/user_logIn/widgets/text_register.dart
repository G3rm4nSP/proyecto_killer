import 'package:flutter/material.dart';
import 'package:proyecto_killer/styles/text_style.dart';
import 'package:proyecto_killer/ui/user_register/user_register_page.dart';

Padding textRegister(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "No tienes cuenta?",
          style: textStyle(Colors.black),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UserRegister()),
            );
          },
          child: Text(
            "Registrate",
            style: textStyle(Colors.blue, true),
          ),
        ),
      ],
    ),
  );
}
