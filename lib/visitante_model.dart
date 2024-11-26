import 'package:cloud_firestore/cloud_firestore.dart';

class Visitante {
  String id;
  String nombre;
  String identificacion;
  String motivoVisita;
  String aQuienVisita;
  DateTime horaEntrada;
  DateTime horaSalida;
  String medioTransporte;
  int acompanantes;
  String fotoUrl;

  Visitante({
    required this.id,
    required this.nombre,
    required this.identificacion,
    required this.motivoVisita,
    required this.aQuienVisita,
    required this.horaEntrada,
    required this.horaSalida,
    required this.medioTransporte,
    required this.acompanantes,
    required this.fotoUrl,
  });

  // Convertir a Map para Firestore
  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'identificacion': identificacion,
      'motivoVisita': motivoVisita,
      'aQuienVisita': aQuienVisita,
      'horaEntrada': horaEntrada,
      'horaSalida': horaSalida,
      'medioTransporte': medioTransporte,
      'acompanhantes': acompanantes,
      'fotoUrl': fotoUrl,
    };
  }

  // Convertir de Map a objeto Visitante
  static Visitante fromMap(String id, Map<String, dynamic> map) {
    return Visitante(
      id: id,
      nombre: map['nombre'] ?? '',
      identificacion: map['identificacion'] ?? '',
      motivoVisita: map['motivoVisita'] ?? '',
      aQuienVisita: map['aQuienVisita'] ?? '',
      horaEntrada: (map['horaEntrada'] as Timestamp).toDate(),
      horaSalida: (map['horaSalida'] as Timestamp).toDate(),
      medioTransporte: map['medioTransporte'] ?? '',
      acompanantes: map['acompanhantes'] ?? 0,
      fotoUrl: map['fotoUrl'] ?? '',
    );
  }
}
