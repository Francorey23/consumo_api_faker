

import 'package:consumo_api_store/screans/home_page.dart';
import 'package:flutter/material.dart';

//LoginPage nombre de mi Widgwt que puede cambiar su estado a lo largo del tiempo
class LoginPage extends StatefulWidget {
  //Es el constructor del widget
  const LoginPage({super.key});

  @override
  //Retorna una nueva instancia de estado del widget para la LOGICA
  State<LoginPage> createState() => _LoginPageState();
}

  //_LoginPageState() Clase que contiene la logica y estado interno para el login page
  class _LoginPageState extends State<LoginPage>{
   final TextEditingController _emailController = TextEditingController();
   final TextEditingController _passwordController = TextEditingController();

   //Llevando las siguientes contraseñas
   final String _correctEmail = 'admin';
   final String _correctPassword = '123';

   void _login(){
    final String email = _emailController.text;
    final String password = _passwordController.text;

    if (email == _correctEmail && password == _correctPassword) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context)=>const MenuHome()),
        );
    } else{
      ScaffoldMessenger.of(context).showSnackBar(
       const SnackBar(
          content: Text('Correo electrónico Incorrecto'),
        ),
      );                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    }
  }



//manejo el estado de mi widget LoginPage para el DISEÑO

  @override
  //build(BuildContext context) metodo escencial. Describe como formaría la UI  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Transform.translate(
          offset: const Offset(0, 5),
          child: const Text(
            'Login',
            textAlign: TextAlign.center,
            ),
          ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network('https://c8.alamy.com/compes/r9bten/colorido-aumentar-o-agregar-el-icono-usuarios-sobre-fondo-gris-r9bten.jpg',
              height: 100,
              width: 100,
              ),
              const SizedBox(height: 20),
              //Caja de texto
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Correo Electrónico',
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: _login,
              child: const Text('Iniciar Sesión'),
              ),
            ],
          ),
        ),
    );
  }
}