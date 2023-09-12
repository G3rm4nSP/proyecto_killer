class User {
  String id;
  String nombre;
  String correo;
  String contrasena;
  String foto;
  String? edad;
  String? genero;
  String? telefono;
  String? tipoUsuario;

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

  @override
  String toString() {
    return 'User{$id, $nombre, $correo, $contrasena, $foto}';
  }
}
