
import 'package:consumo_api_store/screans/login_page.dart';
import 'package:flutter/material.dart';
import 'package:consumo_api_store/flutter_bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
    const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => AuthBloc(),
        child: const LoginPage(),
        )
    );
  }
}
