
import 'package:flutter/material.dart';



class MyTabla  extends StatelessWidget {
  const MyTabla({super.key});
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
          body: const Center(
            child: MyContenTabla(),
          ),
      ),
    );
  }
}

class MyContenTabla extends StatelessWidget {
  const MyContenTabla({super.key});
  @override
  Widget build(BuildContext context) {
    return DataTable(  
      columns: const <DataColumn>[
      DataColumn(label: Text('Nombre')),
      DataColumn(label: Text('Existencia')),
      DataColumn(label: Text('Precio'))
    ], rows:  const <DataRow> [
      DataRow(
        cells:<DataCell>[
          DataCell(Text('pc')),
          DataCell(Text('25')),
          DataCell(Text('25'))
      ])
    ],);
  }
}
