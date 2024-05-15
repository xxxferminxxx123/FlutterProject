import 'package:flutter/material.dart';
import 'package:flutter_application_2/add_producto.dart';
import 'package:flutter_application_2/api_handler.dart';
import 'package:flutter_application_2/edit_page.dart';
import 'package:flutter_application_2/model.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ApiHandler apiHandler = ApiHandler();
  late List<Producto> data = [];

  void getData() async {
    data = await apiHandler.getProductos();
    setState(() {});
  }

  void deleteProducto(int idProducto) async{
  await apiHandler.deleteProducto(idProducto: idProducto);
  setState(() {});

  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Api"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        bottomNavigationBar: MaterialButton(
          color: Colors.amber,
          textColor: Colors.white,
          padding: const EdgeInsets.all(10),
          onPressed: getData,
          child: const Text('Refresh'),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal,
          focusColor: Colors.white,
          onPressed: (){
            Navigator.push(context, 
              MaterialPageRoute(
                builder: (context) => const AddProducto()
              )
            );
          },
          child: const Icon(Icons.add),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditPage(
                            producto: data[index],
                          ),
                        ),
                      );
                    },
                    leading: Text("${data[index].idProducto}"),
                    title: Text("${data[index].nombre}"),
                    subtitle: Text("${data[index].descripcion}"),
                    trailing: IconButton(
                    icon: Icon(Icons.delete_outline),
                    onPressed: (){
                      deleteProducto(data[index].idProducto);
                    },),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
