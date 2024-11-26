class Visitante {
  String id; // ID del visitante (usualmente el ID de Firebase)
  String nombre; // Nombre del visitante
  String email; // Email del visitante

  // Constructor para crear un objeto Visitante
  Visitante({required this.id, required this.nombre, required this.email});

  // Método para convertir el objeto a un mapa (usado al guardar en Firestore)
  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'email': email,
    };
  }

  // Método para crear un objeto Visitante desde un mapa (usado al leer de Firestore)
  static Visitante fromMap(String id, Map<String, dynamic> map) {
    return Visitante(
      id: id,
      nombre: map['nombre'] ?? '',
      email: map['email'] ?? '',
    );
  }
}
