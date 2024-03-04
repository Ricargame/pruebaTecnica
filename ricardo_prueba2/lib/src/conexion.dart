import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ricardo_prueba2/src/alert.dart';
import 'package:ricardo_prueba2/src/lista.dart';

Future conection(context,qr) async{
    // var url = 'http://10.11.12.101/api/point-of-sales/1000000/product-prices?price_list_id=1000019&search_value=$qr&warehouse_id=1000079&page_size=15';
    // var key = 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIyMDE3Mjc2IiwiQURfQ2xpZW50X0lEIjoxMDAwMDAxLCJBRF9PcmdfSUQiOjEwMDAwMDksIkFEX1JvbGVfSUQiOjEwMDAwMzEsIkFEX1VzZXJfSUQiOjEwMDEyMTIsIk1fV2FyZWhvdXNlX0lEIjowLCJBRF9MYW5ndWFnZSI6ImVzX01YIiwiaWF0IjoxNzA5MzE3ODQwLCJleHAiOjE3MDk0MDQyNDB9.ECMBpJr_8Iz0Q-tSsgBX978q4-1FqJvWRNIVemdSUsQ';
    var url = 'http://10.11.12.194/api/point-of-sales/1000000/product-prices?price_list_id=101&search_value=$qr&warehouse_id=103&page_size=15';
    var key = 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxMDAwMjY4IiwiQURfQ2xpZW50X0lEIjoxMSwiQURfT3JnX0lEIjowLCJBRF9Sb2xlX0lEIjoxMDIsIkFEX1VzZXJfSUQiOjEwMSwiTV9XYXJlaG91c2VfSUQiOjAsIkFEX0xhbmd1YWdlIjoiZXNfTVgiLCJpYXQiOjE3MDk1MjE4OTcsImV4cCI6MTcwOTYwODI5N30.levhQ6cFVrNkvE-uojXJvBDaEbgKd_KVb06N4ROeIsw';
    var header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $key'
    };
    
    var response = await http.get(Uri.parse(url), headers: header);
    print(response.body);
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
    List<Map<String,dynamic>> listaDato = [];
    listaDato.clear();
      var dato = jsonDecode(response);
     var cont = int.parse(dato['record_count']);
      print('contado $cont');
      if (dato['product_prices'].isNotEmpty){
      for (int i = 0; i < cont; i++){
        print(i);
        var value =dato['product_prices'][i]['quantity_available'];
        var nom = dato['product_prices'][i]['product']['name'];
        var prec =dato['product_prices'][i]['price_standard'];
        listaDato.add({
          'nombre':nom,
          'precio':prec,
          'value':value
        });
      }
       ViewTab(context,listaDato);
      
    }else{
      listaDato.add({
          'nombre':'Producto',
          'precio':'no',
          'value':'Encontrado'
        });
        ViewTab(context,listaDato);
  }
}
  
Future<Future<Object?>> ViewTab (context,conted) async {
    return Navigator.push(context,MaterialPageRoute(builder: (context) =>MyTabla(datos: conted)));
}
