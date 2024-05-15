import 'package:flutter/material.dart';
import 'package:flutter_application_2/SecondScreen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bienvenidos ... !"),
        backgroundColor: Colors.red,
        foregroundColor: Color.fromARGB(255, 196, 214, 230),
      ),
      body: const Center(
        child: CardExamplesApp(),
      ),
    );
  }
}

class CardExamplesApp extends StatelessWidget {
  const CardExamplesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            _buildCard(context, 'Restaurantes', 'Descripción de restaurantes', Icons.restaurant),
            _buildCard(context, 'Hoteles', 'Descripción de hoteles', Icons.hotel),
            _buildCard(context, 'Comida Rápida', 'Descripción de comida rápida', Icons.fastfood),
            _buildCard(context, 'Discotecas', 'Descripción de discotecas', Icons.music_note),
            _buildCard(context, 'Mototaxistas', 'Descripción de mototaxistas', Icons.directions_bike),
            _buildCard(context, 'Another Card', 'Descripción de Another Card', Icons.star),
            _buildCard(context, 'Another Card', 'Descripción de Another Card', Icons.favorite),
            _buildCard(context, 'Another Card', 'Descripción de Another Card', Icons.directions_bus),
            _buildCard(context, 'Another Card', 'Descripción de Another Card', Icons.local_cafe),
            _buildCard(context, 'Another Card', 'Descripción de Another Card', Icons.local_bar),
            _buildCard(context, 'Another Card', 'Descripción de Another Card', Icons.local_pizza),
            _buildCard(context, 'Another Card', 'Descripción de Another Card', Icons.shopping_cart),
            _buildCard(context, 'Another Card', 'Descripción de Another Card', Icons.train),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, String cardName, String description, IconData iconData) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          // Navegar a otra ventana cuando se pulsa la tarjeta
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondScreen(cardName: cardName)),
          );
        },
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: 50,
                color: Colors.blue, // Puedes ajustar el color según tus preferencias
              ),
              SizedBox(height: 10),
              Text(
                cardName,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                description,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

