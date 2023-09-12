//import 'dart:convert';

class Jugador {
  String nombre;
  String? victima;
  String? arma;

  //constructor
  Jugador({
    required this.nombre,
    this.victima,
    this.arma,
  });

  //constructor solo nombre
  Jugador.justName({required this.nombre});

  //transforma los datos de un map a un modelo jugador
  /*Jugador.fromMap(Map<String, dynamic> dato)
      : nombre = dato['nombre']!,
        victima = dato['victima'],
        arma = dato['arma'];

  //devuelve los datos a un formato json
  String json = jsonEncode(Jugador);
*/
  @override
  String toString() => nombre;
}
