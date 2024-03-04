import 'package:flutter/material.dart';
import 'package:ricardo_prueba2/src/scaner.dart';

class MyButton extends StatefulWidget {
  const MyButton({super.key});

  @override
  State<MyButton> createState() => _MyButtonState();
}
class _MyButtonState extends State<MyButton> {


  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(onPressed: () => scaner(context),label:const Icon(Icons.camera),backgroundColor: Colors.lightBlue, foregroundColor: Colors.white,);
  }
}

