import 'package:flutter/material.dart';
import 'package:proyecto_killer/domain/entities/jugador.dart';

class AlertaObjetivo extends StatelessWidget {
  const AlertaObjetivo({
    super.key,
    required this.asesino,
    required this.textControllerJugador,
  });

  final Jugador asesino;
  final TextEditingController textControllerJugador;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Tu objetivo es"),
      content: Text("Matar a ${asesino.victima} con ${asesino.arma}"),
      actions: [
        TextButton(
            onPressed: () {
              textControllerJugador.clear();
              Navigator.of(context).pop();
            },
            child: const Text("OKAY"))
      ],
    );
  }
}
