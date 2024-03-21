import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductsJewelery extends StatefulWidget {
  const ProductsJewelery({super.key});

  @override
  State<ProductsJewelery> createState() => _ProductsJeweleryState();
}

class _ProductsJeweleryState extends State<ProductsJewelery> {
  late Future<List<dynamic>> products;

  @override
  void initState() {
    super.initState();
    products = fetchJewelryProducts();
  }

Future<List<dynamic>> fetchJewelryProducts() async {
  final response = await http.get(Uri.parse('https://fakestoreapi.com/products/category/jewelery'));
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load jewelry products');
  }
}



//Diseño de la aplicación
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jewelry Products'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: products,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var product = snapshot.data![index];
                return ListTile(
                  title: Text(product['title']),
                  subtitle: Text('\$${product['price']}'),
                  leading: Image.network(product['image'], width: 50, height: 50,),
                );
              },
            );
          } else {
            return const Center(child: Text('No products found'));
          }
        },
      ),
    );
  }
}