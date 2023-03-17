import 'package:flutter/material.dart';
import 'package:qr_reader/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier{
  
  List<ScanModel> scans = [];
  String tipoSeleccionado = 'https';

  Future<ScanModel> nuevoScan(String valor) async{
    final nuevoScan = ScanModel(valor: valor);
    final id = await DBProvider.db.nuevoScan(nuevoScan);
    //Asignar el id de la BD al modelo creado
    nuevoScan.id = id;

    //Asginar a la lista de Scans si es del mismo tipo
    if (tipoSeleccionado == nuevoScan.tipo){
      scans.add(nuevoScan);
      notifyListeners();
    }

    return nuevoScan;

  }

  cargarScans() async{
    final scansdb = await DBProvider.db.getScans();
    scans = [...scansdb];
    notifyListeners();
  }

  cargarScansByTipo(String tipo) async{
    final scansdb = await DBProvider.db.getScansByTipo(tipo);
    scans = [...scansdb];
    tipoSeleccionado = tipo;
    notifyListeners();
  }

  borrarScans() async{
    await DBProvider.db.deleteAllScans();
    scans = [];
    notifyListeners();
  }

  borrarScansById(int id) async{
    await DBProvider.db.deleteScan(id);
  }

}