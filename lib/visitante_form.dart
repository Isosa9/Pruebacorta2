import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'visitante_model.dart';

class VisitanteForm extends StatefulWidget {
  final Visitante? visitante;

  const VisitanteForm({Key? key, this.visitante}) : super(key: key);

  @override
  _VisitanteFormState createState() => _VisitanteFormState();
}

class _VisitanteFormState extends State<VisitanteForm> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _identificacionController = TextEditingController();
  final _motivoVisitaController = TextEditingController();
  final _aQuienVisitaController = TextEditingController();
  final _horaEntradaController = TextEditingController();
  final _horaSalidaController = TextEditingController();
  final _medioTransporteController = TextEditingController();
  final _acompanhantesController = TextEditingController();
  final _fotoUrlController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.visitante != null) {
      _nombreController.text = widget.visitante!.nombre;
      _identificacionController.text = widget.visitante!.identificacion;
      _motivoVisitaController.text = widget.visitante!.motivoVisita;
      _aQuienVisitaController.text = widget.visitante!.aQuienVisita;
      _horaEntradaController.text = widget.visitante!.horaEntrada.toString();
      _horaSalidaController.text = widget.visitante!.horaSalida.toString();
      _medioTransporteController.text = widget.visitante!.medioTransporte;
      _acompanhantesController.text = widget.visitante!.acompanantes.toString();
      _fotoUrlController.text = widget.visitante!.fotoUrl;
    }
  }

  void _saveVisitante() async {
    if (_formKey.currentState!.validate()) {
      final visitantesRef = FirebaseFirestore.instance.collection('visitantes');
      if (widget.visitante == null) {
        // Crear nuevo visitante
        await visitantesRef.add({
          'nombre': _nombreController.text,
          'identificacion': _identificacionController.text,
          'motivoVisita': _motivoVisitaController.text,
          'aQuienVisita': _aQuienVisitaController.text,
          'horaEntrada':
              Timestamp.fromDate(DateTime.parse(_horaEntradaController.text)),
          'horaSalida':
              Timestamp.fromDate(DateTime.parse(_horaSalidaController.text)),
          'medioTransporte': _medioTransporteController.text,
          'acompanhantes': int.parse(_acompanhantesController.text),
          'fotoUrl': _fotoUrlController.text,
        });
      } else {
        // Actualizar visitante
        await visitantesRef.doc(widget.visitante!.id).update({
          'nombre': _nombreController.text,
          'identificacion': _identificacionController.text,
          'motivoVisita': _motivoVisitaController.text,
          'aQuienVisita': _aQuienVisitaController.text,
          'horaEntrada':
              Timestamp.fromDate(DateTime.parse(_horaEntradaController.text)),
          'horaSalida':
              Timestamp.fromDate(DateTime.parse(_horaSalidaController.text)),
          'medioTransporte': _medioTransporteController.text,
          'acompanhantes': int.parse(_acompanhantesController.text),
          'fotoUrl': _fotoUrlController.text,
        });
      }
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.visitante == null ? 'Nuevo Visitante' : 'Editar Visitante'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nombreController,
                decoration: InputDecoration(labelText: 'Nombre'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa un nombre';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _identificacionController,
                decoration: InputDecoration(labelText: 'Identificación'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa una identificación';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _motivoVisitaController,
                decoration: InputDecoration(labelText: 'Motivo de la visita'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa el motivo de la visita';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _aQuienVisitaController,
                decoration: InputDecoration(labelText: 'A quién visita'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa a quién visita';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _horaEntradaController,
                decoration: InputDecoration(
                    labelText: 'Hora de entrada (YYYY-MM-DD HH:MM:SS)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa la hora de entrada';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _horaSalidaController,
                decoration: InputDecoration(
                    labelText: 'Hora de salida (YYYY-MM-DD HH:MM:SS)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa la hora de salida';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _medioTransporteController,
                decoration: InputDecoration(labelText: 'Medio de transporte'),
              ),
              TextFormField(
                controller: _acompanhantesController,
                decoration: InputDecoration(labelText: 'Acompañantes'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _fotoUrlController,
                decoration: InputDecoration(labelText: 'URL de la foto'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _saveVisitante,
                child: Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
