import 'package:flutter/material.dart';
void  alert (context,text) async{
  return showDialog(
    context: context, 
    builder: (BuildContext context){
      return  AlertDialog(
        title: const Text('Alerta', textAlign: TextAlign.center,),
        content: Text(text, textAlign: TextAlign.center,),
        actions: <Widget>[
          TextButton(onPressed: () {
            Navigator.of(context).pop();
          }, child: const Text('Cancelar')),
        ],
      );
    });
}


void alert2 (context,nom,prec,exis) async{
  return showDialog(
    context: context, 
    builder: (BuildContext context){
      return  AlertDialog(
        title: const Text('Alerta', textAlign: TextAlign.center,),
        content: const Text('Producto encontrado', textAlign: TextAlign.center,),
        actions: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
              TextButton(onPressed: () {
              Navigator.of(context).pop();},child: const Text('Cancelar'),),
              TextButton(
            onPressed: () {
              // Navigator.push(context,MaterialPageRoute(builder: (context) =>MyTabla(nombre: nom, precio: prec, existen: exis,)));
            }, 
          child: const Text('Ver'))
              ],
            ),
        ],
      );
    });
}