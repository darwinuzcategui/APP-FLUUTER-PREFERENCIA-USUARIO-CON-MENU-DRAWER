import 'package:flutter/material.dart';
import 'package:prefrenciausuarioapp/src/pag/inicio_pag.dart';
import 'package:prefrenciausuarioapp/src/pag/settings_pag.dart';
import 'package:prefrenciausuarioapp/src/preferencia/preferencia_usuarios.dart';
 
void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciaUsuarios();
  await prefs.initPrefs();
  runApp(MyApp());

  }
 
class MyApp extends StatelessWidget {

  final prefs = new PreferenciaUsuarios();
  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      title: 'Preferencias',
      // initialRoute: InicioPag.routerName,
      initialRoute: prefs.ultimaPagAccesaada,
      
      

      routes: {
        InicioPag.routerName:( BuildContext context )=> InicioPag(),
        SettingPag.routerName:( BuildContext context )=> SettingPag(),
        
        

      },
     
      
    );
  }
}