import 'package:flutter/material.dart';

class CategoryState extends StatelessWidget {
const CategoryState({super.key});

  @override
  Widget build(BuildContext context) {
    //Lista de categorias con sus iconos
    final categorys = [
      {'nombre': 'Celulares', 'icono': Icons.smartphone},
      {'nombre': 'Computadores', 'icono': Icons.computer},
      {'nombre': 'Electrodomésticos', 'icono': Icons.kitchen},
      {'nombre': 'TV', 'icono': Icons.tv},
      {'nombre': 'TV', 'icono': Icons.tv},
      {'nombre': 'Accesorios', 'icono': Icons.headset},
      {'nombre': 'VideoJuegos', 'icono': Icons.videogame_asset},
      {'nombre': 'Audio', 'icono': Icons.audiotrack},
      {'nombre': 'Cámaras', 'icono': Icons.camera_alt},
      {'nombre': 'Pines', 'icono': Icons.push_pin},
      {'nombre': 'Hogar', 'icono': Icons.home},
      {'nombre': 'Casa Inteligente', 'icono': Icons.lightbulb},
      {'nombre': 'Deportes', 'icono': Icons.sports_soccer},

    ];
    
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Categorías'),
      ),
      body: GridView.builder(
        padding:  EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          ), 
          itemCount: categorys.length,
          itemBuilder: (context, index){
             // Realiza una conversión explícita a los tipos correctos.
            final IconData icono = categorys[index]['icono'] as IconData;
            final String nombre = categorys[index]['nombre'] as String;
            return Card(
              child: InkWell(
                onTap: () {
                  print('Tocaste $nombre');
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                   Icon(icono, size: 50), //usa la variable convertida
                   Text(nombre), 
                  ],
                ),
              ),
            );
          },
      ),
    ); 
  }
} 
      