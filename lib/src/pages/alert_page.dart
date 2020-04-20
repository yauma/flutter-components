import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AlertPage")),
      body: Center(
          child: RaisedButton(
        color: Colors.blue,
        child: Text("Mostrar Alert"),
        textColor: Colors.white,
        shape: StadiumBorder(),
        onPressed: () => _mostrarDialog(context),
      )),
    );
  }

  _mostrarDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
                side: BorderSide(color: Colors.black26)),
            title: Text("Titulo"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("Este es el contenido del alert message. Ciao, besitos"),
                FlutterLogo(size: 50.0)
              ],
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("Cancelar")),
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("Ok")),
            ],
          );
        });
  }
}
