import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';

import 'package:qr_reader/utils/utils.dart';

class ScanTiles extends StatelessWidget {

  final String tipo;

  const ScanTiles({super.key, required this.tipo});

  @override
  Widget build(BuildContext context) {
    
    //Aqui si se necesita volver a dibujar el widget porque actualizamos esta pagina , por eso quitamos el listen: false
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return Scaffold(
      body: ListView.builder(
        itemCount: scans.length,
        itemBuilder: (_, index) => Dismissible(
          key: UniqueKey(),
          background: Container(
            color: Colors.red,
          ),
          onDismissed: (direction) {
            Provider.of<ScanListProvider>(context, listen: false).borrarScansById(scans[index].id!);
          },
          child: ListTile(
            leading: Icon(
              tipo == 'https' ? Icons.home_outlined : Icons.map_outlined, 
              color: Theme.of(context).primaryColor
            ),
            title: Text(scans[index].valor),
            subtitle: Text( scans[index].id.toString() ),
            trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
            onTap: () => launchURL(context, scans[index]),
          ),
        )
      )
    );
  }
}