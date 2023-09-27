import 'package:flutter/material.dart';

class AlertaMuerteConfimada extends StatelessWidget {
  const AlertaMuerteConfimada({
    super.key,
    required this.textControllerAsesino,
    required this.textControllerArma,
    required this.textControllerJugador,
  });

  final TextEditingController textControllerAsesino;
  final TextEditingController textControllerArma;
  final TextEditingController textControllerJugador;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Muerte Confirmada"),
      content: Text(
          "Has muerto a manos de ${textControllerAsesino.text} con ${textControllerArma.text}.\nTu objetivo pasa a manos de tu asesino\n y recuerda, los muertos no hablan"),
      actions: [
        TextButton(
            onPressed: () {
              textControllerAsesino.clear();
              textControllerArma.clear();
              textControllerJugador.clear();
              Navigator.of(context).pop();
            },
            child: const Text("Aceptar"))
      ],
    );
  }
}

class AlertaMuerteNoConfirmada extends StatelessWidget {
  const AlertaMuerteNoConfirmada({
    super.key,
    required this.textControllerAsesino,
    required this.textControllerArma,
    required this.textControllerJugador,
  });

  final TextEditingController textControllerAsesino;
  final TextEditingController textControllerArma;
  final TextEditingController textControllerJugador;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Datos incorrectos"),
      content:
          const Text("Los datos ingresados no coinciden con los de tu asesino"),
      actions: [
        TextButton(
          onPressed: () {
            textControllerAsesino.clear();
            textControllerArma.clear();
            textControllerJugador.clear();
            Navigator.of(context).pop();
          },
          child: const Text("Aceptar"),
        ),
      ],
    );
  }
}
