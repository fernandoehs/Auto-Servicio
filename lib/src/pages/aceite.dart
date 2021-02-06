//import 'dart:ffi';

//import 'package:autoservicio/src/models/producto_model.dart';
//import 'package:autoservicio/src/widgets/card_swiper_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class AceitePage extends StatefulWidget {

  @override
  _AceitePageState createState() => _AceitePageState();
}

class _AceitePageState extends State<AceitePage> {
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
      body: 
       Column(
        children: <Widget>[
        Container(
          width: 400,
          height: 200,
          decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
          image:AssetImage("lib/images/aceite.jpg"), 
          fit:BoxFit.cover
        ),
       ),
      ),
         
        Container(
          child: Column(
          children:<Widget>[
            formulario(),
          ], 
         ),
        ),
  
  

      ]
    ),
  );
}

 
 Widget formulario(){
   return Form(
     key: formaceiteKey,
     child:Column(children: <Widget>[
       _crearKilometraje(),
       _crearCosto(),
       _crearBoton(context),
      // _recibirNotificaciones(),
     ],
    ), 
   );
 }

Widget _crearKilometraje(){
  return TextFormField(
    keyboardType:TextInputType.number,
    decoration: InputDecoration(
      labelText: 'Ingresar Kilometraje Actual'
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

Widget _crearCosto(){
  return TextFormField(
    keyboardType:TextInputType.number,
    decoration: InputDecoration(
      labelText: 'Ingrese Costo'
    ),
     validator: (value) {
        final intNumber = int.tryParse(value);
        if (intNumber != null && intNumber <= 2021 && intNumber >= 1995){
          return null;
        }
        return 'Ingrese un costo válido';
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
     label: Text('Guardar'),
     icon: Icon(Icons.check),
     onPressed: ()=>Navigator.pushNamed(context, 'producto' ),
   );
 }
 

}