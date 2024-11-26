class Visitante {
  String id;
  String nombre;
  String email;
  String motivovista;
  String Aquienvisita;
  String Horaentra;
  String HoraSalida;

  Visitante({required this.id, required this.nombre, required this.email});

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'email': email,
      'motivovisita': motivovista,
      'Aquienvisita': Aquienvisita,
      'Horaestrada': Horaentra,
      'HoraSalida': HoraSalida,
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
