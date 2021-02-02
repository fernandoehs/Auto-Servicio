//import 'package:autoservicio/src/utils/utils.dart' as utils;
import 'package:autoservicio/src/widgets/card_swiper_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
final formKey = GlobalKey<FormState>();

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
        child:  SingleChildScrollView(
            child: Column(
            
            children:<Widget>[
            _swiperTarjetas(),
            formulario(),
          ],
            
          ),
        ),
      
        ) ,
    );
  }

  Widget _swiperTarjetas() {

   return CardSwiper(
     autos: [1,2,3,4,5],

     
   );
  }

 Widget formulario(){
   return Form(
     key: formKey,
     child:Column(children: <Widget>[
       _crearKilometraje(),
       _crearYear(),
       _crearBoton(),
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

 Widget _crearBoton(){
   return RaisedButton.icon(
     shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(20.0),
     ),
     color: Colors.redAccent,
     textColor: Colors.white,
     label: Text('Calcular'),
     icon: Icon(Icons.check),
     onPressed: _submit,
   );
 }

 void _submit(){

  if(!formKey.currentState.validate()) return;
   
   print('ok');
 }
}