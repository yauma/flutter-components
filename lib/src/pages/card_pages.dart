import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Cards")),
        body: ListView(
          padding: EdgeInsets.all(2.0),
          children: _createCards(),
        ));
  }

  List<Widget> _createCards() {
    return [
      card1(),
      card2(),
      card1(),
      card2(),
      card1(),
      card2(),
      card1(),
      card2(),
      card1(),
      card2(),
    ];
  }

  Container card1() {
    return Container(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Card(
        elevation: 10.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.image),
              title: Text('Hola Mundo'),
              subtitle: Text(
                  'Esto es un texto de prueba para ver como funciona el subtitle y como se ve en una Card. Ciao, besitos.'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(onPressed: () {}, child: Text('Cancelar')),
                FlatButton(onPressed: () {}, child: Text('Ok')),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container card2() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26, blurRadius: 10.0, offset: Offset(2, 10))
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: Container(
          child: Column(
            children: <Widget>[
              FadeInImage(
                placeholder: AssetImage('assets/original.gif'),
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1519302959554-a75be0afc82a?ixlib=rb-1.2.1&auto=format&fit=crop&w=1662&q=80'),
                fadeInDuration: Duration(milliseconds: 200),
                height: 300.0,
                fit: BoxFit.cover,
              ),
              Center(
                child: Text('Say Hello to my little friend'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
