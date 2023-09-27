import 'package:flutter/material.dart';

import 'package:proyecto_killer/ui/killer_game/widgets/register_players_buttons.dart';

import '../../domain/entities/jugador.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  List<Jugador> jugadores = [];
  List<String> objetos = [];

  final textControllerNombre = TextEditingController();
  final textControllerObjeto1 = TextEditingController();
  final textControllerObjeto2 = TextEditingController();
  final textControllerObjeto3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        TextField(
          controller: textControllerNombre,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Nombre',
          ),
        ),
        TextField(
          controller: textControllerObjeto1,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Objeto 1',
          ),
        ),
        TextField(
          controller: textControllerObjeto2,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Objeto 2',
          ),
        ),
        TextField(
          controller: textControllerObjeto3,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Objeto 3',
          ),
        ),

//BOTON DE GUARDADO

        BotonGuardado(
            textControllerNombre: textControllerNombre,
            textControllerObjeto1: textControllerObjeto1,
            textControllerObjeto2: textControllerObjeto2,
            textControllerObjeto3: textControllerObjeto3,
            jugadores: jugadores,
            objetos: objetos),

//BOTON DE MOSTRAR LISTAS
        BotonMostrarDatos(jugadores: jugadores, objetos: objetos),
//BOTON DE LIMPIEZA
        BotonLimiarDatos(jugadores: jugadores, objetos: objetos),
//BOTON DE FINALIZAR
        BotonFInalizarRegistro(jugadores: jugadores, objetos: objetos)
      ],
    ));
  }
}
