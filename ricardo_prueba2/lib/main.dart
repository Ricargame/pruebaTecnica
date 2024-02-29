import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'src/lista.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
   
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: MyButton()
        ),
      ),
    );
  }
}




class MyButton extends StatefulWidget {
  const MyButton({super.key});

  @override
  State<MyButton> createState() => _MyButtonState();
}
class _MyButtonState extends State<MyButton> {
  Future<void> conection (qr) async {
    var nom;
    var prec;
    var value;
    var url = 'http://10.11.12.101/api/point-of-sales/1000000/product-prices?price_list_id=1000019&search_value=$qr&warehouse_id=1000079&page_size=15';
    var key = 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIyMDE3MjcwIiwiQURfQ2xpZW50X0lEIjoxMDAwMDAxLCJBRF9PcmdfSUQiOjEwMDAwMDksIkFEX1JvbGVfSUQiOjEwMDAwMzEsIkFEX1VzZXJfSUQiOjEwMDEyMTIsIk1fV2FyZWhvdXNlX0lEIjoxMDAwMDc5LCJBRF9MYW5ndWFnZSI6ImVzX01YIiwiaWF0IjoxNzA5MjMxMDgxLCJleHAiOjE3MDkzMTc0ODF9.j3135k2ULHwntWe4daEaTaZUSJYlibdxf3ZVkz-RdjU';
    var header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $key'
    };
  var response = await http.get(Uri.parse(url), headers: header);
  print (response.body);
  if (response.statusCode == 200){
    var dato = jsonDecode(response.body);
    print('conectado correctamente');
    
    if (dato['product_prices'][0]['product']['name'] != ''){
      alert('Producto encontrados');
    value =dato['product_prices'][0]['product']['value'];
    nom = dato['product_prices'][0]['product']['name'];
    prec =dato['product_prices'][0]['price_standard'];

    }else {
      alert('Producto no encontrado');
    }
  }else {
    print('Error de conexion');
    print(response.body);
  }

    
 
  }

  Future<void> scaner() async {
    String barcodeScner;
     barcodeScner = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.DEFAULT);
    conection(barcodeScner);
  }

  Future alert (String texto) {
    return showDialog(
      context: context, 
      builder: (BuildContext context) { 
      return AlertDialog(
        title: const Text('Alerta'),
        content: Text(texto),
        actions:<Widget> [
          const Expanded(child:SizedBox()),
          TextButton(onPressed: () { 
            setState(() {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  const MyTabla()));
            });}, child: const Text('ver'))
        ],
      );
     });
  }

  

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(onPressed: () => scaner(),label: const Text('ESCANEAR'));
  }
}

