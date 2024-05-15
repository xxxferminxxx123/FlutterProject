import 'package:flutter/material.dart';
import 'package:flutter_application_2/api_handler.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class AddProducto extends StatefulWidget {
  const AddProducto({super.key});
  
  get producto => null;

  @override
  State<AddProducto> createState() => _AddProductoState();
}

class _AddProductoState extends State<AddProducto> {


  final _formKey =GlobalKey<FormBuilderState>();
  ApiHandler apihandler= ApiHandler();

  void addProducto() async{
    if(_formKey.currentState!.saveAndValidate()){
      final data= _formKey.currentState!.value;
      // final producto=  Producto(idProducto: 0,nombre: data['nombre'], descripcion: data['descripcion']);
    await apihandler.addProducto(nombre: data['nombre'], descripcion: data['descripcion']);
      
    }
    if(!mounted)return;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Agregar productos"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        bottomNavigationBar: MaterialButton(
          color: Colors.amber,
          textColor: Colors.white,
          padding: const EdgeInsets.all(10),
          onPressed:addProducto,
          child: const Text('Agregar'),
        ),
         body: Padding(
          padding: const EdgeInsets.all(10),
          child: FormBuilder(
            key: _formKey,
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