import 'dart:convert';
import 'package:autoservicio/src/models/producto_model.dart';
import 'package:http/http.dart' as http;

class AutosProvider{

  final String _url ='https://auto-servicio-3073e-default-rtdb.firebaseio.com';

  Future<bool> crearAuto(ProductoModel producto) async{

    final url ='$_url/autos.json';

    final resp = await http.post(url, body:productoModelToJson(producto));

    final decodedData = json.decode(resp.body);

    print (decodedData);

    return true;
  }
  

  Future<bool> editarAuto(ProductoModel producto) async{

    final url ='$_url/autos/${ producto.id }.json';

    final resp = await http.put(url, body:productoModelToJson(producto));

    final decodedData = json.decode(resp.body);

    print (decodedData);

    return true;
  }


    Future<List<ProductoModel>> cargarAuto() async{

    final url ='$_url/autos.json';

    final resp = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<ProductoModel> autos = new List();
    
    if(decodedData ==null) return [];

    decodedData.forEach((id,prod){

      final prodTemp = ProductoModel.fromJson(prod);
      prodTemp.id =id;

      autos.add(prodTemp);
     
    });
    //print (autos[0].kilometraje);

    return autos;
  }

  Future<int> borrarAuto(String id) async{
     final url = '$_url/autos/$id.json';
     final resp = await http.delete(url);

     print (json.decode(resp.body));

     return 1;


  }


}