import 'dart:convert';
import 'package:consumo_api_store/screans/products_jewelery.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MenuHome extends StatefulWidget {
  const MenuHome({Key? key}) : super(key: key);

  @override
  State<MenuHome> createState() => _MenuHomeState();
}

class _MenuHomeState extends State<MenuHome> {
  late Future<List<String>> categories;

  @override
  void initState() {
    super.initState();
    categories = fetchCategories();
  }

  Future<List<String>> fetchCategories() async {
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products/categories'));

    if (response.statusCode == 200) {
      List<dynamic> categoriesJson = jsonDecode(response.body);
      return categoriesJson.map((category) => category.toString()).toList();
    } else {
      throw Exception('No se han podido cargar las categorias');
    }
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
          title: const Text('Menu FakeStore'),
      backgroundColor: Colors.blue, // Fondo del AppBar
    ),
    body: FutureBuilder<List<String>>(
      future: categories,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          return ListView(
            padding: const EdgeInsets.all(8), // Espaciado exterior para toda la lista
            children: snapshot.data!.map((category) => Container(
              margin: const EdgeInsets.all(10), // Espaciado entre cada elemento de la lista
              decoration: BoxDecoration(
                color: Colors.blue, // Fondo de cada elemento
                border: Border.all(color: Colors.lightBlue), // Borde de cada elemento
                borderRadius: BorderRadius.circular(10), // Bordes redondeados
              ),
              child: ListTile(
                leading: Icon(Icons.category, color: Colors.white), // Icono con color personalizado
                title: Text(category,
                  style: TextStyle(
                    color: Colors.white, // Color del texto
                  ),
                ),
                onTap: () {
                  //print(category);
                  // Aquí decides a dónde navegar basado en la categoría
                    if (category.toLowerCase() == 'jewelery') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ProductsJewelery()),
                      );
                    } else {
                      print(category);
                      // Aquí puedes manejar la navegación para otras categorías si es necesario
                      }
                  },   
                ),
                )
              ).toList(),
            );
          } else {
          return const Center(child: Text('No se encontraron categorias'));
          }
        },
      ),
    );
  }
}
