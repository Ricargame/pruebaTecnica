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
    return FloatingActionButton.extended(onPressed: () => scaner(context),label: const Text('ESCANEAR'),backgroundColor: Colors.lightBlue, foregroundColor: Colors.white,);
  }
}

class Mybutton2 extends StatefulWidget {
  const Mybutton2({super.key});

  @override
  State<Mybutton2> createState() => _Mybutton2State();
}

class _Mybutton2State extends State<Mybutton2> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(onPressed: ()=> (context),label: const Text('Ver tabla'),);
  }
}
