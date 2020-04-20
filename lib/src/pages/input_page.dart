import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = "";
  String dropdownValue = 'One';

  TextEditingController _inputDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Input Page")),
        body: ListView(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          children: _crearWidgets(context),
        ));
  }

  List<Widget> _crearWidgets(BuildContext context) {
    return [
      createInputField(),
      Divider(),
      createEmailField(),
      Divider(),
      createPasswordField(),
      Divider(),
      createDate(context),
      Divider(),
      crearDropDown()
    ];
  }

  Widget createInputField() {
    return TextField(
      textCapitalization: TextCapitalization.words,
      autofocus: true,
      decoration: InputDecoration(
          counter: Text("Letras ${_nombre.length}"),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: "Nombre",
          hintText: "Nombre y   Apellido",
          helperText: "Solo el primer apellido",
          suffixIcon: Icon(Icons.delete),
          icon: Icon(Icons.account_circle)),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  Widget createEmailField() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        labelText: "e-mail",
        hintText: "mimail@mail.com",
        icon: Icon(Icons.email),
      ),
    );
  }

  Widget createPasswordField() {
    return TextField(
      obscureText: true,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        labelText: "password",
        helperText: "must contain capital letters and numbers",
        icon: Icon(Icons.lock),
      ),
    );
  }

  Widget createDate(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputDateController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        labelText: "fecha de nacimiento",
        hintText: "fecha de nacimiento",
        suffixIcon: Icon(Icons.calendar_view_day),
        icon: Icon(Icons.calendar_today),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _createDatePicker(context);
      },
    );
  }

  void _createDatePicker(BuildContext context) async {
    DateTime selectedDate = await showDatePicker(
      locale: Locale('es'),
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2025),
    );
    if (selectedDate != null) {
      setState(() {
        var formatter = new DateFormat('yyyy-MM-dd');
        String formattedDate = formatter.format(selectedDate);
        _inputDateController.text = formattedDate;
      });
    }
  }

  Widget crearDropDown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 20.0),
        Expanded(
          child: DropdownButton<String>(
            value: dropdownValue,
            icon: Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.black),
            underline: Container(
              height: 2,
              color: Colors.blue,
            ),
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            },
            items: getDropDownMenu(),
          ),
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> getDropDownMenu() {
    return <String>['One', 'Two', 'Three', 'Four']
        .map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();
  }
}
