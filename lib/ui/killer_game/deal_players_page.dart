import 'package:flutter/material.dart';
import 'package:proyecto_killer/domain/entities/Jugador.dart';
import 'package:proyecto_killer/ui/killer_game/widgets/deal_players_buttons.dart';

class DealPage extends StatefulWidget {
  const DealPage({
    super.key,
    required this.jugadores,
    required this.objetos,
  });

  final List<Jugador> jugadores;
  final List<String> objetos;

  @override
  State<DealPage> createState() => _DealPageState();
}

class _DealPageState extends State<DealPage> {
  final textControllerJugador = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: textControllerJugador,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Quien eres?',
            ),
          ),
          //BOTON DE ASIGNAR VICTIMA
          BotonAsignarObjetivo(
            jugadores: widget.jugadores,
            objetos: widget.objetos,
            textControllerJugador: textControllerJugador,
          ),
          //CONFIRMAR MUERTE
          BotonConfirmarMuerte(
            jugadores: widget.jugadores,
            textControllerJugador: textControllerJugador,
          ),
          //RETROCEDER
          const BotonRetroceder(),
        ],
      ),
    );
  }
}
