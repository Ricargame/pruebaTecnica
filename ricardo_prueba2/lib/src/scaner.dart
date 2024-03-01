import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:ricardo_prueba2/src/conexion.dart';
 Future<void> scaner(context) async {
    String barcodeScner;
     barcodeScner = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.DEFAULT);
    if (barcodeScner.isNotEmpty){
      conection(context,barcodeScner);
    }
    
  }