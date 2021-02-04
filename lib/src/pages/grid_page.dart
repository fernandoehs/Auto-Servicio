import 'package:flutter/material.dart';


class ProductPage extends StatelessWidget {
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
        
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  
                 Container(
                      height: 800,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: <Widget>[

                          new GestureDetector(
                          onTap: ()=>Navigator.pushNamed(context, 'aceite' ),
                          child: Container(
                          width: 50,
                          height: 100,
                          decoration: BoxDecoration(
                          color: Colors.black,
                          image: DecorationImage(
                          image:AssetImage("lib/images/aceite.jpg"), 
                          fit:BoxFit.cover
                              
                         ),
                        ),
                        ),
                         ),
                          new GestureDetector(
                          onTap: ()=>Navigator.pushNamed(context, 'prueba' ),
                          child: Container(
                          width: 50,
                          height: 100,
                          decoration: BoxDecoration(
                          color: Colors.black,
                          image: DecorationImage(
                          image:AssetImage("lib/images/bujias.jpg"), 
                          fit:BoxFit.cover
                              
                         ),
                        ),
                        ),
                         ),
                          Container(
                            width: 50,
                            height: 100,
                            decoration: BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                              image:AssetImage("lib/images/liqfreno.jpg"), 
                              fit:BoxFit.cover
                            ),
                           ),
                          ),
                          Container(
                            width: 50,
                            height: 100,
                              decoration: BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                              image:AssetImage("lib/images/frenos.jpg"), 
                              fit:BoxFit.cover
                            ),
                           ),
                          ),Container(
                            width: 50,
                            height: 100,
                                decoration: BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                              image:AssetImage("lib/images/correa.jpg"), 
                              fit:BoxFit.cover
                            ),
                           ),
                          ),
                          Container(
                            width: 50,
                            height: 100,
                             decoration: BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                              image:AssetImage("lib/images/bateria.jpg"), 
                              fit:BoxFit.cover
                            ),
                           ),
                          ),
                          Container(
                            width: 50,
                            height: 100,
                             decoration: BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                              image:AssetImage("lib/images/caja.jpg"), 
                              fit:BoxFit.cover
                            ),
                           ),
                          ),
                          Container(
                            width: 50,
                            height: 100,
                             decoration: BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                              image:AssetImage("lib/images/cadena.jpg"), 
                              fit:BoxFit.cover
                            ),
                           ),
                          ),
                              Container(
                            width: 50,
                            height: 100,
                             decoration: BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                              image:AssetImage("lib/images/frenostras.jpg"), 
                              fit:BoxFit.cover
                            ),
                           ),
                          ),
                          Container(
                            width: 50,
                            height: 100,
                             decoration: BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                              image:AssetImage("lib/images/filtroaire.jpg"), 
                              fit:BoxFit.cover
                            ),
                           ),
                          ),
                          Container(
                            width: 50,
                            height: 100,
                             decoration: BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                              image:AssetImage("lib/images/alineacion.jpg"), 
                              fit:BoxFit.cover
                            ),
                           ),
                          ),
                        ],
                      ),
                    ),
                  
              
                ],
              ),
            ),
          ),
        ),
      );
    
  }
}