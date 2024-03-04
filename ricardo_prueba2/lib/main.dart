import 'package:flutter/material.dart';
import 'package:ricardo_prueba2/src/button.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: const Center(
          child: Text('Escane el codigo de su producto'),
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


