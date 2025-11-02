import 'package:flutter/material.dart';
import 'package:peticio_api2/models/personaje_model.dart';
import 'package:peticio_api2/presentation/widgets/no_data_widget.dart';
import 'package:peticio_api2/presentation/widgets/personaje_widget.dart';
import 'package:peticio_api2/services/simpsons_service.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Personaje? personaje;
  List numerosSalidos = [];
  int numero = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Los Simpsons'),
        elevation: 10,
        centerTitle: true,
      ),
      body: (personaje == null)
          ? NoDataWidget(
              onLoad: () async {
                SimpsonsService simpsonsService = SimpsonsService();
                int nuevoNumero;
                print('boton pulsado');

                do {
                  nuevoNumero = Random().nextInt(1181) + 1;
                } while (numerosSalidos.contains(nuevoNumero));

                numerosSalidos.add(nuevoNumero);
                personaje = await simpsonsService.getPersonaje(nuevoNumero);
                setState(() {});
              },
            )
          : PersonajeWidget(personaje: personaje!),
      floatingActionButton: (personaje != null)
          ? FloatingActionButton(
              onPressed: () async {
                do {
                  numero = Random().nextInt(1181) + 1;
                } while (numerosSalidos.contains(numero));
                numerosSalidos.add(numero);
                SimpsonsService simpsonsService = SimpsonsService();
                personaje = await simpsonsService.getPersonaje(numero);
                setState(() {});
              },
              child: Icon(Icons.refresh_outlined),
            )
          : null,
    );
  }
}
