//import 'package:autoservicio/src/utils/utils.dart' as utils;
//import 'dart:ffi';

import 'package:autoservicio/src/models/producto_model.dart';
import 'package:autoservicio/src/providers/autos_providers.dart';
import 'package:autoservicio/src/widgets/card_swiper_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
 
}

class _HomePageState extends State<HomePage> {
final formKey = GlobalKey<FormState>();
final productoProvider = new AutosProvider();
ProductoModel producto = new ProductoModel();

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
        
       // child:  SingleChildScrollView(
            child: Column(
            
            children:<Widget>[
                  _swiperTarjetas(),
            
           //formulario(),
            
            _recibirNotificaciones(),
              Expanded(
              
                        child:  _crearListado(),
                      
              )
              
            
            
          ],
            
          ),
        //),
      
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
     // _crearKilometraje(),
       //_crearYear(),
       //_crearBoton(context),
      
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
     label: Text('Calcular'),
     icon: Icon(Icons.check),
     //onPressed: ()=>Navigator.pushNamed(context, 'producto' ),
     onPressed: _submit,
   );
 }
 Widget _recibirNotificaciones(){
   return SwitchListTile(
     value: producto.disponible,
     title: Text('Disponible'),
     activeColor: Colors.deepPurple,
     onChanged: (value)=> setState((){
       producto.disponible=value;
     }),
     );
 }

 void _submit(){


   if(!formKey.currentState.validate()) return;

   formKey.currentState.save();
   //print(producto.year);
   //print(producto.kilometraje);
  // print(producto.disponible);
   //print(producto.id);
   
   productoProvider.crearAuto(producto);
 }

 Widget _crearListado(){

   return FutureBuilder(
     future:productoProvider.cargarAuto(),
     builder:(BuildContext context, AsyncSnapshot <List<ProductoModel>> snapshot){
      if(snapshot.hasData){
        final autos= snapshot.data;
        return ListView.builder(
          itemCount: autos.length,
          itemBuilder: (context, i) => _crearItem(context, autos[i]),
        );
      }else{
        return Center( child: CircularProgressIndicator());
      }
     },
   );
  
 }

 Widget _crearItem( BuildContext context, ProductoModel autos){
  
   return Dismissible(
     key: UniqueKey(),
     background: Container(
       color: Colors.red,
     ),
     onDismissed: (direccion){
       productoProvider.borrarAuto(autos.id);
     },
        child: ListTile(
         title: Text('${autos.kilometraje} - ${autos.year}'),
         subtitle: Text(autos.id),
         onTap: ()=>Navigator.pushNamed(context,'aceite',arguments:autos),
     ),
   );
 }

}