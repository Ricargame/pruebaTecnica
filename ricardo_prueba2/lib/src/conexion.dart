import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ricardo_prueba2/src/alert.dart';
import 'package:ricardo_prueba2/src/lista.dart';

Future conection(context,qr) async{
    var url = 'http://10.11.12.101/api/point-of-sales/1000000/product-prices?price_list_id=1000019&search_value=$qr&warehouse_id=1000079&page_size=15';
    var key = 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIyMDE3Mjc2IiwiQURfQ2xpZW50X0lEIjoxMDAwMDAxLCJBRF9PcmdfSUQiOjEwMDAwMDksIkFEX1JvbGVfSUQiOjEwMDAwMzEsIkFEX1VzZXJfSUQiOjEwMDEyMTIsIk1fV2FyZWhvdXNlX0lEIjowLCJBRF9MYW5ndWFnZSI6ImVzX01YIiwiaWF0IjoxNzA5MzE3ODQwLCJleHAiOjE3MDk0MDQyNDB9.ECMBpJr_8Iz0Q-tSsgBX978q4-1FqJvWRNIVemdSUsQ';
    var header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $key'
    };
    var response = await http.get(Uri.parse(url), headers: header);
    if (response.statusCode == 200){
      if (response.body.isNotEmpty){
        CapData(context, response.body);
      }else{
        alert(context,'Body vacio');
      }
     
    }else {
    alert(context,'Error de conexion');
    print(response.body);
  }

}


Future<void> CapData (context,response) async {
    print(response);
      var dato = jsonDecode(response);
      if (dato['product_prices'].isNotEmpty){
      for (int i = 0; i < dato.length; i++){
        var value =dato['product_prices'][i]['product']['value'];
        var nom = dato['product_prices'][i]['product']['name'];
        var prec =dato['product_prices'][i]['price_standard'];
        var nomSplit = nom.split(' ');
      //  ViewTab(context,nomSplit[0],prec,value);
      ListData(context,nomSplit,value,prec);
      }
      
    }else{
      alert(context, 'Producto no encontrado');
  }
}
  
Future<Future<Object?>> ViewTab (context,nombre,value,precio) async {
    return Navigator.push(context,MaterialPageRoute(builder: (context) =>MyTabla(nombre: nombre,precio: precio,value: value,)));
}

void ListData(context,nom,val,prec){
  Map nombre = {'nombre':nom};
  Map value = {'Value':val};
  Map precio = {'Precio':prec};
  ViewTab(context,nombre,value,precio);
}
