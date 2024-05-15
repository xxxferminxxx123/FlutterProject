import 'dart:convert';
import 'package:flutter_application_2/model.dart';
import 'package:flutter_application_2/modelLocal.dart';
import 'package:http/http.dart' as http;

class ApiHandlerLocal {
  final String baseUri =
      "http://localhost:5206/api/Local"; // Ajusta esta URI

  Future<List<Local>> getLocales() async {
    List<Local> local = [];

    final uri = Uri.parse(baseUri + '/Lista');
    try {
      final response = await http.get(
        uri,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final List<dynamic> jsonResponse =
            json.decode(response.body); // es una lista de objetos JSON
        local = jsonResponse
            .map((item) => Local.fromJson(item))
            .toList(); // Mapea la lista a Producto
      }
    } catch (e) {
      // Maneja errores aquí si es necesario
      print("Error fetching productos: $e");
    }

    return local;
  }
}