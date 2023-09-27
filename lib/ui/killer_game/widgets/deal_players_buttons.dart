import 'package:flutter/material.dart';
import 'package:proyecto_killer/domain/entities/jugador.dart';
import 'package:proyecto_killer/ui/killer_game/widgets/alerta_errores.dart';
import 'package:proyecto_killer/ui/killer_game/widgets/alerta_muerte.dart';
import 'package:proyecto_killer/ui/killer_game/widgets/alerta_objetivo.dart';

class BotonRetroceder extends StatelessWidget {
  const BotonRetroceder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: const Text("Retroceder"),
    );
  }
}

class BotonConfirmarMuerte extends StatelessWidget {
  const BotonConfirmarMuerte({
    super.key,
    required this.jugadores,
    required this.textControllerJugador,
  });

  final List<Jugador> jugadores;
  final TextEditingController textControllerJugador;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          String nombreJugador = textControllerJugador.text;
          final textControllerArma = TextEditingController();
          final textControllerAsesino = TextEditingController();

          bool correcto = false;

          Jugador victima = Jugador.justName(nombre: nombreJugador);

          for (int i = 0; i < jugadores.length; i++) {
            if (jugadores[i].nombre == victima.nombre) {
              correcto = true;
              victima = jugadores[i];
            }
          }
          if (!correcto) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertaErrorNombreNoEncontrado(
                  textControllerJugador: textControllerJugador,
                );
              },
            );
          } else {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("¿Quien te ha matado?"),
                  content: Column(
                    children: [
                      for (var jugador in jugadores) Text(jugador.nombre),
                      TextField(
                        controller: textControllerAsesino,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Nombre de tu asesino',
                        ),
                      ),
                      TextField(
                        controller: textControllerArma,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Arma utilizada',
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    //CANCELAR
                    botonCancelar(
                        textControllerAsesino, textControllerArma, context),
                    //COMPROBAR MUERTE
                    BotonComprobarMuerte(
                      jugadores: jugadores,
                      victima: victima,
                      textControllerJugador: textControllerJugador,
                      textControllerAsesino: textControllerAsesino,
                      textControllerArma: textControllerArma,
                    ),
                  ],
                );
              },
            );
          }
        },
        child: const Text("Me han matado"));
  }

  TextButton botonCancelar(TextEditingController textControllerAsesino,
      TextEditingController textControllerArma, BuildContext context) {
    return TextButton(
        onPressed: () {
          textControllerJugador.clear();
          textControllerAsesino.clear();
          textControllerArma.clear();
          Navigator.of(context).pop();
        },
        child: const Text("Cancelar"));
  }
}

class BotonComprobarMuerte extends StatelessWidget {
  const BotonComprobarMuerte({
    super.key,
    required this.jugadores,
    required this.victima,
    required this.textControllerJugador,
    required this.textControllerAsesino,
    required this.textControllerArma,
  });

  final List<Jugador> jugadores;
  final Jugador victima;
  final TextEditingController textControllerJugador;
  final TextEditingController textControllerAsesino;
  final TextEditingController textControllerArma;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        //Navigator.pop(context);
        bool correcto = false;
        String nombreAsesino = textControllerAsesino.text;
        String arma = textControllerArma.text;

        Jugador asesino = Jugador.justName(nombre: nombreAsesino);

        //FALTA DE DATOS
        if (nombreAsesino == "" || arma == "") {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return const AlertaErrorCamposVacios();
              });
        } else {
          for (int i = 0; i < jugadores.length; i++) {
            if (jugadores[i].nombre == nombreAsesino) {
              correcto = true;
              asesino = jugadores[i];
            }
          }
          if (!correcto) {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertaErrorNombreNoEncontrado(
                    textControllerJugador: textControllerAsesino,
                  );
                });
          } else if (asesino.arma == arma &&
              asesino.victima == victima.nombre) {
            asesino.arma = victima.arma;
            asesino.victima = victima.victima;
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertaMuerteConfimada(
                  textControllerAsesino: textControllerAsesino,
                  textControllerArma: textControllerArma,
                  textControllerJugador: textControllerJugador,
                );
              },
            );
          } else {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertaMuerteNoConfirmada(
                  textControllerAsesino: textControllerAsesino,
                  textControllerArma: textControllerArma,
                  textControllerJugador: textControllerJugador,
                );
              },
            );
          }
        }
        // Navigator.of(context).pop();
      },
      child: const Text("Comprobar Muerte"),
    );
  }
}

class BotonAsignarObjetivo extends StatelessWidget {
  const BotonAsignarObjetivo({
    super.key,
    required this.jugadores,
    required this.objetos,
    required this.textControllerJugador,
  });

  final List<Jugador> jugadores;
  final List<String> objetos;
  final TextEditingController textControllerJugador;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        String nombreJugador = textControllerJugador.text;
        bool correcto = false;
        Jugador asesino = Jugador.justName(nombre: nombreJugador);
        Jugador victima = Jugador.justName(nombre: "victima");
        for (int i = 0; i < jugadores.length; i++) {
          if (jugadores[i].nombre == asesino.nombre) {
            correcto = true;
            asesino = jugadores[i];

            //asigna victima
            if (i == jugadores.length - 1) {
              victima = jugadores.first;
            } else {
              victima = jugadores[i + 1];
            }

            //asigna arma
            asesino.victima = victima.nombre;
            if (asesino.arma == null) {
              asesino.arma = objetos.first;
              objetos.removeAt(0);
            }
          }
        }

        if (correcto) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertaObjetivo(
                asesino: asesino,
                textControllerJugador: textControllerJugador,
              );
            },
          );
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertaErrorNombreNoEncontrado(
                textControllerJugador: textControllerJugador,
              );
            },
          );
        }
      },
      child: const Text("Mostrar Objetivo"),
    );
  }
}
