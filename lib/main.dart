import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'visitante_form.dart';
import 'visitante_model.dart';

class visitanteListpage extends StatelessWidget {
  final CollectionReference visitanteRef =
      FirebaseFirestore.instance.collection('visitantes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List  visit'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VisitanteForm(),
                ),
              );
            },
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: visitanteRef.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          final data = snapshot.data!;
          final visitantes = data.docs
              .map((doc) =>
                  Visitante.fromMap(doc.id, doc.data() as Map<String, dynamic>))
              .toList();
          return ListView.builder(
            itemCount: visitantes.length,
            itemBuilder: (context, index) {
              final visitante = visitantes[index];
              return ListTile(
                title: Text(visitante.nombre),
                subtitle: Text(visitante.email),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VisitanteForm(visitante: visitante),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
