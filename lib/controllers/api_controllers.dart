import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiControllers {
  static Future<dynamic> getSingleProduct(int id) async {
    final singleProduct = Uri.parse("https://fakestoreapi.com/products/$id");
    final respose = await http.get(singleProduct);
    // print(respose.statusCode);
    // print(respose.body);
    return jsonDecode(respose.body);
  }
}
