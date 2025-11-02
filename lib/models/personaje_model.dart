// To parse this JSON data, do
//
//     final personaje = personajeFromJson(jsonString);

import 'dart:convert';

Personaje personajeFromJson(String str) => Personaje.fromJson(json.decode(str));

String personajeToJson(Personaje data) => json.encode(data.toJson());

class Personaje {
  int id;
  int age;
  String description;
  String gender;
  String name;
  String occupation;
  List<String> phrases;
  String portraitPath;
  String status;

  Personaje({
    required this.id,
    required this.age,
    required this.description,
    required this.gender,
    required this.name,
    required this.occupation,
    required this.phrases,
    required this.portraitPath,
    required this.status,
  });

  String getImage() {
    return 'https://cdn.thesimpsonsapi.com/500$portraitPath';
  }

  factory Personaje.fromJson(Map<String, dynamic> json) => Personaje(
    id: json["id"],
    age: json["age"] ?? 0,
    description: json["description"],
    gender: json["gender"],
    name: json["name"],
    occupation: json["occupation"],
    phrases: List<String>.from(json["phrases"].map((x) => x)),
    portraitPath: json["portrait_path"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "age": age,
    "description": description,
    "gender": gender,
    "name": name,
    "occupation": occupation,
    "phrases": List<dynamic>.from(phrases.map((x) => x)),
    "portrait_path": portraitPath,
    "status": status,
  };
}
