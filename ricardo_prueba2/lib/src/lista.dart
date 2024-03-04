import 'package:flutter/material.dart';

class MyTabla extends StatefulWidget {
  final List<Map<String,dynamic>>datos;
  const MyTabla({super.key, required this.datos});

  @override
  
  State<MyTabla> createState() => _MyTablaState();
}

class _MyTablaState extends State<MyTabla> {
  
  @override
  Widget build(BuildContext context) {
      
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.blue,
        title: const Text('Tabla de producto'),
        centerTitle: true,
      ),
      body: Center(
        child:  DataTable(columns: const <DataColumn>[
      DataColumn(label: Text('Nombre',textAlign:TextAlign.center)),
      DataColumn(label: Text('Precio',textAlign:TextAlign.center)),
      DataColumn(label: Text('Almacen',textAlign:TextAlign.center))
    ], rows: widget.datos.map((dato){
      return DataRow(cells: <DataCell> [
        DataCell(Text(dato['nombre']??'Producto',)),
        DataCell(Text(dato['precio']?? 'no',)),
        DataCell(Text(dato['value']??'encontrado'))
      ]);
    }).toList(),
    ),
      ),
    );
    
   
  }
}


