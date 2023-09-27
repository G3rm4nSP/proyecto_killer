import 'package:flutter/material.dart';
import 'package:proyecto_killer/domain/entities/jugador.dart';

import 'package:proyecto_killer/ui/killer_game/widgets/alerta_datos.dart';
import 'package:proyecto_killer/ui/killer_game/widgets/alerta_errores.dart';
import 'package:proyecto_killer/ui/killer_game/widgets/alerta_registro.dart';

class BotonLimiarDatos extends StatelessWidget {
  const BotonLimiarDatos({
    super.key,
    required this.jugadores,
    required this.objetos,
  });

  final List<Jugador> jugadores;
  final List<String> objetos;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertaLimpiarDatos(jugadores: jugadores, objetos: objetos);
            });
      },
      child: const Text('Limpiar'),
    );
  }
}

class BotonMostrarDatos extends StatelessWidget {
  const BotonMostrarDatos({
    super.key,
    required this.jugadores,
    required this.objetos,
  });

  final List<Jugador> jugadores;
  final List<String> objetos;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertaMostrarDatos(jugadores: jugadores, objetos: objetos);
            });
      },
      child: const Text('Mostrar'),
    );
  }
}

class BotonGuardado extends StatelessWidget {
  const BotonGuardado({
    super.key,
    required this.textControllerNombre,
    required this.textControllerObjeto1,
    required this.textControllerObjeto2,
    required this.textControllerObjeto3,
    required this.jugadores,
    required this.objetos,
  });

  final TextEditingController textControllerNombre;
  final TextEditingController textControllerObjeto1;
  final TextEditingController textControllerObjeto2;
  final TextEditingController textControllerObjeto3;
  final List<Jugador> jugadores;
  final List<String> objetos;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          String nombre = textControllerNombre.text;
          String objeto1 = textControllerObjeto1.text;
          String objeto2 = textControllerObjeto2.text;
          String objeto3 = textControllerObjeto3.text;
          //print("pruebas: ${textControllerNombre.text}");
          if (nombre == "" || objeto1 == "" || objeto2 == "" || objeto3 == "") {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const AlertaErrorCamposVacios();
                });
          } else {
            //nombre repetido
            bool repetido = false;
            for (var jugador in jugadores) {
              if (jugador.nombre == nombre) repetido = true;
            }
            if (repetido) {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertaErrorNombreRepetido(
                        textControllerNombre: textControllerNombre);
                  });
            } else {
              //confirmar datos
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertaConfirmarDatos(
                    nombre: nombre,
                    objeto1: objeto1,
                    objeto2: objeto2,
                    objeto3: objeto3,
                    jugadores: jugadores,
                    objetos: objetos,
                    textControllerNombre: textControllerNombre,
                    textControllerObjeto1: textControllerObjeto1,
                    textControllerObjeto2: textControllerObjeto2,
                    textControllerObjeto3: textControllerObjeto3,
                  );
                },
              );
            }
          }
        },
        child: const Text("Guardar"));
  }
}

class BotonFInalizarRegistro extends StatelessWidget {
  const BotonFInalizarRegistro({
    super.key,
    required this.jugadores,
    required this.objetos,
  });

  final List<Jugador> jugadores;
  final List<String> objetos;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertaFinDeRegistro(
                  jugadores: jugadores, objetos: objetos);
            });
      },
      child: const Text("Finalizar"),
    );
  }
}
