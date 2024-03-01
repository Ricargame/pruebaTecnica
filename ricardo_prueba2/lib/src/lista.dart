
import 'package:flutter/material.dart';

class MyTabla  extends StatelessWidget {
  final nombre;
  final value;
  final precio;
  const MyTabla({super.key, this.nombre, this.value, this.precio});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(  
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Contenido'),
          centerTitle: true,
          backgroundColor: Colors.blue,
          ),
          body: Center(
            child: DataTable(columns: 
            const <DataColumn> [
              DataColumn(label: Expanded(child: Text('Nombre',style:TextStyle(fontSize:10),textAlign: TextAlign.center))),
              DataColumn(label: Expanded(child: Text('Codigo',style:TextStyle(fontSize:10),textAlign: TextAlign.center))),
              DataColumn(label: Expanded(child: Text('Precio',style:TextStyle(fontSize:10),textAlign: TextAlign.center))),
            ], 
            rows: <DataRow>[
                DataRow(cells: <DataCell> [
                DataCell(Text(nombre['nombre'][0],style: const TextStyle(fontSize:10),textAlign: TextAlign.center)),
                DataCell(Text(value['Value'],style: const TextStyle(fontSize: 10),textAlign: TextAlign.center)),
                DataCell(Text(precio['Precio'],style: const TextStyle(fontSize: 10),textAlign: TextAlign.center)),
              ])
            ]),
          ),
      ),
    );
  }
}


