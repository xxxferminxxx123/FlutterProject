import 'package:flutter/material.dart';
import 'package:flutter_application_2/api_Local.dart';
import 'package:flutter_application_2/modelLocal.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SecondScreen extends StatefulWidget {
  final String cardName;

  const SecondScreen({Key? key, required this.cardName}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  late List<Local> locales = [];
  final List<double> ratings = []; // Lista para almacenar calificaciones
  final ApiHandlerLocal apiHandlerLocal = ApiHandlerLocal();

  @override
  void initState() {
    super.initState();
    _fetchLocales();
  }

  Future<void> _fetchLocales() async {
    final fetchedLocales = await apiHandlerLocal.getLocales();
    setState(() {
      locales = fetchedLocales;
      // Aquí puedes establecer calificaciones predeterminadas
      ratings.addAll(List.generate(locales.length, (index) => 4.0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cardName),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: locales.length,
        itemBuilder: (BuildContext context, int index) {
          final local = locales[index];
          final rating = ratings[index]; // Obtener la calificación del restaurante
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/restaurant_image.jpg'),
                ),
                title: Text(local.nombre),
                subtitle: Text(local.direccion),
                trailing: RatingBar.builder(
                  initialRating: rating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 20.0,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    // Update the rating of the restaurant
                    // You may need to call setState here to reflect the changes
                  },
                ),
                onTap: () {
                  _showDetailsModal(context, local.nombre, local.direccion, rating); // Mostrar el modal al hacer clic en la tarjeta
                },
              ),
            ),
          );
        },
      ),
    );
  }

// Dentro del método _showDetailsModal

void _showDetailsModal(BuildContext context, String nombre, String direccion, double rating) {
  int currentPage = 0; // Página actual del PageView

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return StatefulBuilder( // Necesario para actualizar el estado de la página actual
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            height: 500,
            alignment: Alignment.center,
            child: Container(
              height: 300,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      nombre,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'Dirección: $direccion',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    height: 50, // Altura del PageView
                    child: PageView.builder(
                      itemCount: 3, // Número total de imágenes
                      onPageChanged: (index) {
                        setState(() {
                          currentPage = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Image.asset('assets/restaurant_image.jpg'); // Cambia el nombre de archivo según tu convención de nomenclatura
                      },
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          setState(() {
                            currentPage = (currentPage - 1).clamp(0, 2);
                          });
                        },
                      ),
                      Text('${currentPage + 1}/3'), // Muestra la página actual
                      IconButton(
                        icon: Icon(Icons.arrow_forward),
                        onPressed: () {
                          setState(() {
                            currentPage = (currentPage + 1).clamp(0, 2);
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: RatingBar.builder(
                      initialRating: rating,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 30.0,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        // Update the rating of the restaurant
                        // You may need to call setState here to reflect the changes
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}



}
