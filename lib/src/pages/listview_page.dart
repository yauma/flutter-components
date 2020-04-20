import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController _scrollController = ScrollController();
  List<int> _listaNumeros = List<int>();
  var _ultimoItem = 0;
  var _isloading = false;

  @override
  void initState() {
    super.initState();
    _agregar10();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ListViewPage")),
      body: Stack(
        children: <Widget>[
          buildListView(),
          cargarLoader(),
        ],
      ),
    );
  }

  Widget buildListView() => RefreshIndicator(
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            final imagen = _listaNumeros[index];
            return FadeInImage(
                placeholder: AssetImage("assets/original.gif"),
                image:
                    NetworkImage("https://picsum.photos/id/$imagen/500/500"));
          },
          itemCount: _listaNumeros.length,
          controller: _scrollController,
        ),
        onRefresh: refreshPage,
      );

  Widget cargarLoader() {
    if (_isloading) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Center(heightFactor: 2.0, child: CircularProgressIndicator()),
        ],
      );
    } else {
      return Container();
    }
  }

  void _agregar10() {
    for (var i = 1; i < 10; i++) {
      _listaNumeros.add(_ultimoItem++);
    }
    setState(() {});
  }

  void fetchData() async {
    _isloading = true;
    setState(() {});
    Timer(Duration(milliseconds: 2000), () {
      httpequest();
    });
  }

  void httpequest() {
    _isloading = false;
    _agregar10();
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        duration: Duration(milliseconds: 250), curve: Curves.bounceInOut);
  }

  Future<void> refreshPage() async{
    Duration duration = Duration(seconds: 2);
    Timer(duration, (){
      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10();
    });
    return Future.delayed(Duration(seconds: 2));
  }
}
