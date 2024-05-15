import 'dart:convert';
import 'package:flutter_application_2/model.dart';
import 'package:http/http.dart' as http;

class ApiHandler {
  final String baseUri =
      "http://localhost:5206/api/Producto"; // Ajusta esta URI

  Future<List<Producto>> getProductos() async {
    List<Producto> productos = [];

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
        productos = jsonResponse
            .map((item) => Producto.fromJson(item))
            .toList(); // Mapea la lista a Producto
      }
    } catch (e) {
      // Maneja errores aquí si es necesario
      print("Error fetching productos: $e");
    }

    return productos;
  }

  Future<http.Response> updateProducto({required Producto producto}) async {
    // final baseUri = "tu_url_base"; // Reemplaza "tu_url_base" con la URL base de tu servidor
    final uri = Uri.parse(baseUri + '/Modificarsss');
    // final uri = Uri.parse(baseUri+'/Modificar');
    late http.Response response;

    try {
      response = await http.post(uri,
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: json.encode(producto));
      print(response.body);
    } catch (e) {
      print("Error fetching productos: $e");
    }
    return response;
  }

  // Future<http.Response> addProducto({required Producto producto}) async {
  //   final uri = Uri.parse(baseUri + '/Agregar');
  //   late http.Response response;

  //   try {

  //     response = await http.post(uri,
  //         headers: {
  //           'Content-Type': 'application/json; charset=UTF-8',
  //         },
  //         body: json.encode(producto));
  //   } catch (e) {
  //     print("Error fetching productos: $e");
  //   }
  //   return response;
  // }
  Future<http.Response> addProducto(
      {required String nombre, required String descripcion}) async {
    final uri = Uri.parse(baseUri + '/Agregar');
    late http.Response response;

    try {
      final producto = {'nombre': nombre, 'descripcion': descripcion};
      response = await http.post(uri,
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: json.encode(producto));
      print(response.body);
    } catch (e) {
      print("Error fetching productos: $e");
    }
    return response;
  }
    Future<http.Response> deleteProducto(
      {required int idProducto}) async {
  final uri = Uri.parse('$baseUri/Eliminars?idProducto=$idProducto');
    late http.Response response;

    try {
      
      response = await http.post(uri,
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          );
      print(response.body);
    } catch (e) {
      print("Error fetching productos: $e");
    }
    return response;  
  }
}
