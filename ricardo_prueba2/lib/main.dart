import 'package:flutter/material.dart';
import 'package:ricardo_prueba2/src/button.dart';
import 'package:ricardo_prueba2/src/lista.dart';

void main() {
  runApp(const MyApp(datos: [],));
}
class MyApp extends StatelessWidget {
  final List<Map<String,dynamic>>datos;
  const MyApp({super.key, required this.datos});
  
  @override

  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: MyTabla(datos:datos),
        ),
        appBar: AppBar(
          title: const Text('Scaner de producto'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        bottomNavigationBar: const BottomAppBar(
          color: Colors.blue, 
        ),
        floatingActionButton: const MyButton(),
      ),
    );
  }
}


