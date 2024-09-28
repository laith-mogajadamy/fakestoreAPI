import 'dart:convert';

import 'package:fakestoreapi/core/network/global.dart';
import 'package:http/http.dart' as http;

class ProductsReqwest {
  static Future<http.Response> getproducts() async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
    };
    var url = Uri.parse("${Global.url}products");
    http.Response response = await http.get(url, headers: headers);
    print(response);
    var responsemap = jsonDecode(response.body);
    print("responsemap=");
    print(responsemap);
    return response;
  }
  //

  static Future<http.Response> getcategoryproducts(
    String name,
  ) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
    };
    var url = Uri.parse("${Global.url}products/category/$name");
    http.Response response = await http.get(url, headers: headers);
    print(response);
    var responsemap = jsonDecode(response.body);
    print("responsemap=");
    print(responsemap);
    return response;
  }

  //
  static Future<http.Response> getcategories() async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
    };
    var url = Uri.parse("${Global.url}products/categories");
    http.Response response = await http.get(url, headers: headers);
    print(response);
    var responsemap = jsonDecode(response.body);
    print("responsemap=");
    print(responsemap);
    return response;
  }

  static Future<http.Response> addproduct(
    String title,
    double price,
    String description,
    String image,
    String category,
  ) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
    };
    Map data = {
      "title": title,
      "price": price,
      "description": description,
      "image": image,
      "category": category,
    };
    print(data);
    var body = jsonEncode(data);
    var url = Uri.parse("${Global.url}products");
    http.Response response = await http.post(url, headers: headers, body: body);
    print(response.statusCode);
    var responsemap = jsonDecode(response.body);
    print("responsemap=");
    print(responsemap);
    return response;
  }
}
