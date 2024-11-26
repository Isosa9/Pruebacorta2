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
  final _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.visitante != null) {
      // Cargar los datos del visitante en los campos
      _nombreController.text = widget.visitante!.nombre;
      _emailController.text = widget.visitante!.email;
    }
  }

  @override
  void dispose() {
    // Liberar recursos cuando se destruye el widget
    _nombreController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _saveVisitante() async {
    if (_formKey.currentState!.validate()) {
      final visitantesRef = FirebaseFirestore.instance.collection('visitantes');
      if (widget.visitante == null) {
        // Crear un nuevo visitante
        await visitantesRef.add({
          'nombre': _nombreController.text,
          'email': _emailController.text,
        });
      } else {
        // Actualizar un visitante existente
        await visitantesRef.doc(widget.visitante!.id).update({
          'nombre': _nombreController.text,
          'email': _emailController.text,
        });
      }
      Navigator.pop(context); // Regresar a la pantalla anterior
    }
  }

  void _deleteVisitante() async {
    if (widget.visitante != null) {
      final visitantesRef = FirebaseFirestore.instance.collection('visitantes');
      await visitantesRef.doc(widget.visitante!.id).delete();
      Navigator.pop(context); // Regresar a la pantalla anterior
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.visitante == null ? 'Nuevo Visitante' : 'Editar Visitante'),
        actions: widget.visitante != null
            ? [
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: _deleteVisitante,
                ),
              ]
            : null,
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
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa un email';
                  }
                  return null;
                },
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
