
import 'package:flutter/material.dart';
import 'package:prueba_uno/appbar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: AppBarSearch(),
          backgroundColor: Colors.white,
        ),
        
      ),
    );
  }
}