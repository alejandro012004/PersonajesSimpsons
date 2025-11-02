import 'package:http/http.dart';

import '../models/personaje_model.dart';

class SimpsonsService {
  final _url = 'https://thesimpsonsapi.com/api/';

  Future<Personaje?> getPersonaje(int id) async {
    Uri uri = Uri.parse('${_url}characters/${id}');
    Response response = await get(uri);

    if (response.statusCode != 200) return null;

    Personaje personaje = personajeFromJson(response.body);
    print(personaje.name);
    return personaje;
  }
}
