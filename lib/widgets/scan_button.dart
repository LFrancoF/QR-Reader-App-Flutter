import 'package:flutter/material.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';

import 'package:qr_reader/utils/utils.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.filter_center_focus),
      onPressed: () async{
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                                                    '#3D8BEF', 
                                                    'Cancelar', 
                                                    false, 
                                                    ScanMode.QR);
        //const barcodeScanRes = 'https://github.com/LFrancoF';
        //const barcodeScanRes = 'geo:-17.771033,-63.124652';

        if (barcodeScanRes == '-1') return;   //si el usuario cancela el scan, la variable retorna -1 por tanto no hacemos nada
        
        final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
        final newScan = await scanListProvider.nuevoScan(barcodeScanRes);
        // ignore: use_build_context_synchronously
        launchURL(context, newScan);
      },
    );
  }
}