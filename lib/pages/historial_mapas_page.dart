import 'package:flutter/material.dart';

import 'package:qr_reader/widgets/scan_tiles.dart';

class HistorialMapasPage extends StatelessWidget {
   
  const HistorialMapasPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    return const ScanTiles(tipo: 'geo');
    
  }
}