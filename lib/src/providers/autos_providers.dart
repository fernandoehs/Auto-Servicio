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


    Future<List<ProductoModel>> cargarAuto() async{

    final url ='$_url/productos.json';

    final resp = await http.post(url, body:productoModelToJson(producto));

    final decodedData = json.decode(resp.body);

    print (decodedData);

    return true;
  }


}