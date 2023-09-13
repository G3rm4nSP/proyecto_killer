class User {
  late int id;
  late String nombre;
  late String correo;
  late String contrasena;
  late String foto;
  late int? edad;
  late String? genero;
  late int? telefono;
  late String? tipoUsuario;

  User(
      {required this.id,
      required this.nombre,
      required this.correo,
      required this.contrasena,
      required this.foto,
      this.edad,
      this.genero,
      this.telefono,
      this.tipoUsuario});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['name'];
    correo = json['email'];
    contrasena = json['password'];
    foto = json['image'];
    edad = json['age'];
    genero = json['gender'];
    telefono = json['phone'];
    tipoUsuario = json['userType'];
  }

  @override
  String toString() {
    return 'User{$id, $nombre, $correo, $contrasena, $foto}';
  }
}
