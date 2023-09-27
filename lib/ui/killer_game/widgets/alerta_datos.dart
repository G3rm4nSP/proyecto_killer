import 'package:flutter/material.dart';
import 'package:proyecto_killer/domain/entities/Jugador.dart';

class AlertaConfirmarDatos extends StatelessWidget {
  const AlertaConfirmarDatos({
    super.key,
    required this.nombre,
    required this.objeto1,
    required this.objeto2,
    required this.objeto3,
    required this.jugadores,
    required this.objetos,
    required this.textControllerNombre,
    required this.textControllerObjeto1,
    required this.textControllerObjeto2,
    required this.textControllerObjeto3,
  });

  final String nombre;
  final String objeto1;
  final String objeto2;
  final String objeto3;
  final List<Jugador> jugadores;
  final List<String> objetos;
  final TextEditingController textControllerNombre;
  final TextEditingController textControllerObjeto1;
  final TextEditingController textControllerObjeto2;
  final TextEditingController textControllerObjeto3;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Confirmar"),
      content: Column(
        children: [
          Text('Nombre: $nombre'),
          Text('Objeto 1: $objeto1'),
          Text('Objeto 2: $objeto2'),
          Text('Objeto 3: $objeto3'),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              jugadores.add(Jugador.justName(nombre: nombre));
              objetos.add(objeto1);
              objetos.add(objeto2);
              objetos.add(objeto3);

              textControllerNombre.clear();
              textControllerObjeto1.clear();
              textControllerObjeto2.clear();
              textControllerObjeto3.clear();

              objetos.shuffle();
              jugadores.shuffle();

              Navigator.of(context).pop();
            },
            child: const Text("Si")),
        TextButton(
            onPressed: () {
              textControllerNombre.clear();
              textControllerObjeto1.clear();
              textControllerObjeto2.clear();
              textControllerObjeto3.clear();

              Navigator.of(context).pop();
            },
            child: const Text("No")),
      ],
    );
  }
}

class AlertaMostrarDatos extends StatelessWidget {
  const AlertaMostrarDatos({
    super.key,
    required this.jugadores,
    required this.objetos,
  });

  final List<Jugador> jugadores;
  final List<String> objetos;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Datos'),
      content: Column(
        children: [
          Text('Nombres: $jugadores'),
          Text('Objetos: $objetos'),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cerrar'))
      ],
    );
  }
}

class AlertaLimpiarDatos extends StatelessWidget {
  const AlertaLimpiarDatos({
    super.key,
    required this.jugadores,
    required this.objetos,
  });

  final List<Jugador> jugadores;
  final List<String> objetos;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Limpiar'),
      content: const Column(
        children: [
          Text('¿Estas seguro de limpiar las listas?'),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              jugadores.clear();
              objetos.clear();
              Navigator.of(context).pop();
            },
            child: const Text('Si')),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('No'))
      ],
    );
  }
}
