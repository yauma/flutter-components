import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AvatarPage"),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://img.vixdata.io/pd/jpg-large/es/sites/default/files/r/rip-stan-lee.jpg"),
              radius: 25.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text("JQ"),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: FadeInImage(
            image: NetworkImage(
                "https://indiehoy.com/wp-content/uploads/2018/11/stan-lee.jpg"),
            placeholder: AssetImage("assets/original.gif"),
          ),
        ),
      ),
    );
  }
}
