import 'package:flutter/material.dart';
import 'package:prefrenciausuarioapp/src/preferencia/preferencia_usuarios.dart';
// import 'package:prefrenciausuarioapp/src/pag/settings_pag.dart';
import 'package:prefrenciausuarioapp/src/widgets/menu_widget.dart';


class InicioPag extends StatelessWidget {

  static final String routerName = 'inicio';
  final prefs = new PreferenciaUsuarios();
  @override
  Widget build(BuildContext context) {

    prefs.ultimaPagAccesaada = InicioPag.routerName;


    return Scaffold(
      appBar: AppBar(
        backgroundColor: (prefs.colorSecundario) ? Colors.orangeAccent: Colors.blue,
        title: Text('Perferencias de usuarios'),
      ),
      drawer: MenuWidgetDrawer(),
            body: Column( 
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Color Secundario:${ prefs.colorSecundario}'),
                Divider(),
                Text('Género: ${ prefs.genero }'),
                Divider(),
                Text('Nombre de usuario: ${ prefs.nombreUsuario}'),
                Divider(),
              ],
            ),
          );
        }
      /*
        Drawer _crearMenuDrawer(BuildContext context) {
          return Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Container(),
                  decoration:BoxDecoration(
                    image:DecorationImage(
                      image:AssetImage('assets/img2.jpg'),
                      fit: BoxFit.cover
                     ) 

                  ),
                ),
                ListTile(
                  leading:Icon(Icons.pages,color:Colors.amber),
                  title: Text('Pagina'),
                   onTap: ()=>Navigator.pushReplacementNamed(context, InicioPag.routerName),
                ),
                ListTile(
                  leading:Icon(Icons.pan_tool,color:Colors.amber),
                  title: Text('Opc01'),
                  onTap: (){},
                ),
                ListTile(
                  leading:Icon(Icons.add_to_home_screen,color:Colors.amber),
                  title: Text('Opc02'),
                  onTap: (){},
                 
                ),
                ListTile(
                  leading:Icon(Icons.settings,color:Colors.amber),
                  title: Text('Ajuste'),
                  onTap: () { 
                    // Navigator.pop(context); // para cerrar el menu 
                    // Navigator.pushNamed(context, SettingPag.routerName);
                    Navigator.pushReplacementNamed(context, SettingPag.routerName);
                    }
                ),


              ],
            ),
          );
        }
        */
}
