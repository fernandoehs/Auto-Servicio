import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BujiaPage extends StatefulWidget {

  @override
  _BujiaPageState createState() => _BujiaPageState();
}

class _BujiaPageState extends State<BujiaPage> {
final formaceiteKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Auto Servicio'),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search), 
            onPressed: (){},
            )
        ],
        ),
      body: Container(
        width: 400,
        height: 200,
        decoration: BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
        image:AssetImage("lib/images/bujias.jpg"), 
        fit:BoxFit.cover

        ),
    ),
     ) 
     
    );
    }

 

 Widget formulario(){
   return Form(
     key: formaceiteKey,
     child:Column(children: <Widget>[
       _crearKilometraje(),
       _crearYear(),
       _crearBoton(context),
     ],
     ), 
    
   );
 }

Widget _crearKilometraje(){
  return TextFormField(
    keyboardType:TextInputType.number,
    decoration: InputDecoration(
      labelText: 'Kilometraje'
    ),
    validator: (value){
      final intNumber = int.tryParse(value);
        if (intNumber != null && intNumber <= 999999 && intNumber >= 5000){
          return null;
        }
        return 'Ingrese un kilometraje válido';
    },
  );
}

Widget _crearYear(){
  return TextFormField(
    keyboardType:TextInputType.number,
    decoration: InputDecoration(
      labelText: 'Año'
    ),
     validator: (value) {
        final intNumber = int.tryParse(value);
        if (intNumber != null && intNumber <= 2021 && intNumber >= 1995){
          return null;
        }
        return 'Ingrese un año válido';
    },
  );
}

 Widget _crearBoton(BuildContext context){
   return RaisedButton.icon(
     shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(20.0),
     ),
     color: Colors.redAccent,
     textColor: Colors.white,
     label: Text('Calcular'),
     icon: Icon(Icons.check),
     onPressed: ()=>Navigator.pushNamed(context, 'producto' ),
   );
 }

}