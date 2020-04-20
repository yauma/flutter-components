import 'package:flutter/material.dart';
import 'package:flutter_components/src/providers/menu_provider.dart';
import 'package:flutter_components/src/utils/icon_string_utils.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Components"),
      ),
      body: _crearLista(),
    );
  }

  Widget _crearLista() {
    return FutureBuilder(
        future: menuProvider.cargarData(),
        initialData: [],
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          return ListView(
            children: _crearListTiles(snapshot.data, context),
          );
        });
  }

  List<Widget> _crearListTiles(
    dynamic data,
    BuildContext context,
  ) {
    final List<Widget> opciones = [];
    for (var item in data) {
      final listTile = ListTile(
        leading: getIconByString(item['icon']),
        title: Center(child: Text(item['texto'])),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue),
        onTap: () {
          Navigator.pushNamed(context, item['ruta']);
        },
      );
      opciones.add(listTile);
      opciones.add(Divider(thickness: 2.0));
    }
    return opciones;
  }
}
