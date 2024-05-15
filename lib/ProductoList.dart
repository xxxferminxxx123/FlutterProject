import 'package:flutter/material.dart';
import 'package:flutter_application_2/model.dart';
import 'api_handler.dart'; // Importa donde está tu ApiHandler

class ProductoList extends StatefulWidget {
  const ProductoList({super.key});

  @override
  State<ProductoList> createState() => _ProductoListState();
}

class _ProductoListState extends State<ProductoList> {
  final ApiHandler apiHandler = ApiHandler();
  List<Producto> productos = [];

  @override
  void initState() {
    super.initState();
    fetchProductos(); // Obtén los productos al inicializar el estado
  }

  void fetchProductos() async {
    productos = await apiHandler.getProductos(); // Obtén la lista de productos
    setState(() {}); // Actualiza el estado para refrescar la interfaz
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de ProductosSS"),
        backgroundColor: Colors.red,
        foregroundColor: Colors.red,
      ),
      body: Column( 
         children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: productos.length,
              itemBuilder: (context, index) {
                //final producto = productos[index];
                return ListTile(
                  leading:Text("${productos[index].idProducto}")
                 // leading: Text(producto.idProducto.toString()), // Muestra el ID
                  //title: Text(producto.nombre), // Muestra el nombre
                  //subtitle: Text(producto.descripcion), // Muestra la descripción
                );
              },
            ),
      ])
    );
  }
}
