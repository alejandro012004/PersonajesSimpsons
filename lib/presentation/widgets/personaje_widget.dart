import 'package:flutter/material.dart';
import 'package:peticio_api2/models/personaje_model.dart';

class PersonajeWidget extends StatelessWidget {
  const PersonajeWidget({super.key, required this.personaje});

  final Personaje personaje;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 250,
            width: 250,
            child: Image(image: NetworkImage(personaje.getImage())),
          ),
          SizedBox(height: 20),
          Text(
            personaje.name,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(personaje.occupation, style: TextStyle(fontSize: 18)),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: BoxBorder.all(),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Age: ${personaje.age}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Container(
                decoration: BoxDecoration(
                  border: BoxBorder.all(),
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.green[50],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    personaje.status,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          //Frase favorita
          personaje.phrases.isNotEmpty
              ? Text(
                  '"${personaje.phrases[0]}"',
                  style: TextStyle(fontStyle: FontStyle.italic),
                )
              : Text(
                  'Sin frase disponible',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                  ),
                ),
        ],
      ),
    );
  }
}
