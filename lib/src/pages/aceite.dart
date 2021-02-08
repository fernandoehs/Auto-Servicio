//import 'dart:ffi';

//import 'package:autoservicio/src/models/producto_model.dart';
//import 'package:autoservicio/src/widgets/card_swiper_widget.dart';
import 'package:autoservicio/src/models/producto_model.dart';
import 'package:autoservicio/src/providers/autos_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class AceitePage extends StatefulWidget {

  @override
  _AceitePageState createState() => _AceitePageState();
}

class _AceitePageState extends State<AceitePage> {
final formKey = GlobalKey<FormState>();
final productoProvider = new AutosProvider();


ProductoModel producto = new ProductoModel();

  @override
  Widget build(BuildContext context) {

    final ProductoModel prodData = ModalRoute.of(context).settings.arguments;
     if (prodData !=null){
       producto = prodData;
     }

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
     key: formKey,
     child:Column(children: <Widget>[
       _crearKilometraje(),
       _crearYear(),
       _crearBoton(context),
      // _recibirNotificaciones(),
     ],
    ), 
   );
 }


Widget _crearKilometraje(){
  return TextFormField(
    initialValue: producto.kilometraje.toString(),
    keyboardType:TextInputType.number,
    decoration: InputDecoration(
      labelText: 'Kilometraje'
    ),
    onSaved: (value)=>producto.kilometraje = value,
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
    initialValue: producto.year.toString(),
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
Widget _crearYear(){
  return TextFormField(
    initialValue: producto.year.toString(),
    keyboardType:TextInputType.number,
    decoration: InputDecoration(
      labelText: 'Año'
    ),
    onSaved: (value)=> producto.year =value,
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
     label: Text('Guardar'),
     icon: Icon(Icons.check),
     onPressed: _submit,
   );
 }
  void _submit(){


   if(!formKey.currentState.validate()) return;

   formKey.currentState.save();
   //print(producto.year);
   //print(producto.kilometraje);
   //print(producto.disponible);
   //print(producto.id);
   
   if(producto.id == null){
   
   productoProvider.crearAuto(producto);
      
   }else{
      productoProvider.editarAuto(producto);
 }

}
}