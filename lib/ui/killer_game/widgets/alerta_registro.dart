import 'package:flutter/material.dart';
import 'package:proyecto_killer/domain/entities/jugador.dart';
import 'package:proyecto_killer/ui/killer_game/deal_players_page.dart';

class AlertaFinDeRegistro extends StatelessWidget {
  const AlertaFinDeRegistro({
    super.key,
    required this.jugadores,
    required this.objetos,
  });

  final List<Jugador> jugadores;
  final List<String> objetos;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Finalizar'),
      content: const Column(
        children: [
          Text('¿Ya se han registrado todos los integrantes?'),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DealPage(
                          jugadores: jugadores,
                          objetos: objetos,
                        )),
              );
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
