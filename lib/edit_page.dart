import 'package:flutter/material.dart';
import 'package:flutter_application_2/api_handler.dart';
import 'package:flutter_application_2/model.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:http/http.dart' as http;

class EditPage extends StatefulWidget {
  final Producto producto;
  const EditPage({super.key, required this.producto});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final _formKey =GlobalKey<FormBuilderState>();
  late http.Response response;

  void updateData() async{
  ApiHandler apiHandler=ApiHandler();
  if(_formKey.currentState!.saveAndValidate()){
    final data=_formKey.currentState!.value;
    final producto = Producto(
      idProducto:widget.producto.idProducto,
      nombre:data['nombre'],
      descripcion: data['descripcion']
    );
    response = await apiHandler.updateProducto(producto: producto);
    
  }

  if(!mounted) return;
  Navigator.pop(context);


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Editar Productos"),
          backgroundColor: Colors.red,
          foregroundColor: Colors.red,
        ),
        bottomNavigationBar: MaterialButton(
          color: Colors.amber,
          textColor: Colors.white,
          padding: const EdgeInsets.all(10),
          onPressed: updateData,
          child: const Text('Update'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: FormBuilder(
            key: _formKey,
            initialValue: {
              'nombre':widget.producto.nombre,
              'descripcion':widget.producto.descripcion
            },
            child: Column(
              children: [
                FormBuilderTextField(name: 'nombre',
                decoration: const InputDecoration(labelText: 'Nombre'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                ),
                FormBuilderTextField(name: 'descripcion',
                decoration: const InputDecoration(labelText: 'Descripcion'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                )
              ],
            )

          ),
        )
        );
  }
}
