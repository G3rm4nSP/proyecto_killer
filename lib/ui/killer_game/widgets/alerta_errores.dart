import 'package:flutter/material.dart';

class AlertaErrorNombreNoEncontrado extends StatelessWidget {
  const AlertaErrorNombreNoEncontrado({
    super.key,
    required this.textControllerJugador,
  });

  final TextEditingController textControllerJugador;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Nombre invalido"),
      content: const Text(
          'El nombre ingresado no se encuentra en la lista, intenta con otro nombre'),
      actions: [
        TextButton(
            onPressed: () {
              textControllerJugador.clear();
              Navigator.of(context).pop();
            },
            child: const Text("Aceptar")),
      ],
    );
  }
}

class AlertaErrorNombreRepetido extends StatelessWidget {
  const AlertaErrorNombreRepetido({
    super.key,
    required this.textControllerNombre,
  });

  final TextEditingController textControllerNombre;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Nombre invalido"),
      content: const Text(
          'El nombre ingresado se encuentra ya en la lista, intenta con otro nombre'),
      actions: [
        TextButton(
            onPressed: () {
              textControllerNombre.clear();
              Navigator.of(context).pop();
            },
            child: const Text("Aceptar")),
      ],
    );
  }
}

class AlertaErrorCamposVacios extends StatelessWidget {
  const AlertaErrorCamposVacios({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Error"),
      content: const Text(
          "No se pueden dejar campos vacios, por favor rellena todos los campos"),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Aceptar"))
      ],
    );
  }
}
