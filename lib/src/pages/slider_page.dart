import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SliderStatePage();
  }
}

class SliderStatePage extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _checkBoxState = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider Page"),
      ),
      body: Container(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Column(
              children: <Widget>[
                setSlider(),
                createCheckBox(),
                createSwitch(),
                createImage(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget setSlider() {
    return Slider(
      label: "Tamaño de la imagen",
      value: _valorSlider,
      onChanged: (_checkBoxState)
          ? null
          : (value) {
              setState(() {
                _valorSlider = value;
              });
            },
      min: 10,
      max: 400,
    );
  }

  Widget createCheckBox() {
    return CheckboxListTile(
        title: Text("bloquear"),
        value: _checkBoxState,
        onChanged: (toggle) {
          setState(() {
            _checkBoxState = toggle;
          });
        });
  }

  Widget createSwitch() {
    return SwitchListTile(
        title: Text("bloquear"),
        value: _checkBoxState,
        onChanged: (toggle) {
          setState(() {
            _checkBoxState = toggle;
          });
        });
  }

  Widget createImage() {
    return Expanded(
      child: Image(
        image: NetworkImage(
            'https://i0.pngocean.com/files/22/790/414/batman-family-catwoman-robin-comics-batman.jpg'),
        width: _valorSlider,
        fit: BoxFit.contain,
      ),
    );
  }
}
