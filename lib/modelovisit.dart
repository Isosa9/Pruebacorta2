class Visitante {
  String id;
  String nombre;
  String email;

  Visitante({required this.id, required this.nombre, required this.email});

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'email': email,
    };
  }

  static Visitante fromMap(String id, Map<String, dynamic> map) {
    return Visitante(
      id: id,
      nombre: map['nombre'] ?? '',
      email: map['email'] ?? '',
    );
  }
}
