import 'package:flutter/material.dart';
import 'package:prefrenciausuarioapp/src/preferencia/preferencia_usuarios.dart';
import 'package:prefrenciausuarioapp/src/widgets/menu_widget.dart';

class SettingPag extends StatefulWidget {
  static final String routerName = 'settings';

  @override
  _SettingPagState createState() => _SettingPagState();
}

class _SettingPagState extends State<SettingPag> {
  bool _colorSecundario;
  int _genero;
  String _nombre;
  TextEditingController _textController;
  final prefs = new PreferenciaUsuarios();

  @override
  void initState() {
    super.initState();

    prefs.ultimaPagAccesaada = SettingPag.routerName;
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _nombre = prefs.nombreUsuario;

    //  cargarPrefs();
    _textController = new TextEditingController(text: _nombre);
  }

/*
  cargarPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _genero = prefs.getInt('genero');
    setState(() {});
  }
  
  // codigo viejo

  _setSeleccionRadio(int valor) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('genero', valor);
    _genero = valor;
    setState(() {});
  }
  */
  _setSeleccionRadio(int valor) {
    prefs.genero = valor;
    _genero = valor;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor:
              (prefs.colorSecundario) ? Colors.orangeAccent : Colors.blue,
          title: Text('Ajuste Usuarios'),
        ),
        drawer: MenuWidgetDrawer(),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "Settings",
                style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            SwitchListTile(
              value: _colorSecundario,
              title: Text('Color secundario'),
              onChanged: (value) {
                setState(() {
                  _colorSecundario = value;
                  prefs.colorSecundario = value;
                });
              },
            ),
            RadioListTile(
              value: 1,
              title: Text('Masculino'),
              groupValue: _genero,
              onChanged: _setSeleccionRadio,
            ),
            RadioListTile(
                value: 2,
                title: Text('Femenino'),
                groupValue: _genero,
                onChanged: _setSeleccionRadio),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                    labelText: 'Nombre',
                    helperText: 'Nombre de la Persona que usuaando Telefono'),
                onChanged: (value) {
                  prefs.nombreUsuario = value;
                },
              ),
            )
          ],
        ));
  }
}
