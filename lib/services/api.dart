import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nodejs_sv_fl/model/product_model.dart';

class Api {
  static const baseUrl = "http://192.168.0.112/api/";

  // post method
  static addproduct(Map pdata) async {
    print(pdata);
    var url = Uri.parse("${baseUrl}add_products");
    
    try {
      final response = await http.post(url, body: pdata);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
      } else {
        print("Failed to get response");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // get method
  static getProduct() async {
    List<Product> product = [];
    var url = Uri.parse(baseUrl + "get_products"); 

    try {
      final res = await http.get(url);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        print(data);
        data['product'].forEach((value) {
          product.add(Product(
            id: value['id'],
            name: value['pname'],
            price: value['pprice'],
            desc: value['pdesc'],
          ));
        });
        return product;
      } else {
        return [];
      }

    } catch (e) {
      debugPrint(e.toString());
    }
  }

  //update method
  static updateProduct(int id, body) async {
    var url = Uri.parse("${baseUrl}update_products/$id");
    final res = await http.put(
    url,
    headers: {"Content-Type": "application/json"}, // Set header JSON
    body: jsonEncode(body), // Chuyển đổi Map thành chuỗi JSON
  );
    if (res.statusCode == 200) {
      print(jsonDecode(res.body));
    } else {
      print("update failed");
    }
  }

  //delete method
  static deleteProduct(int id) async {
    var url = Uri.parse("${baseUrl}delete_products/$id");
    final res = await http.post(url);
    if (res.statusCode == 204) {
      print(jsonDecode(res.body));
    } else {
      print("delete failed");
    }
  }
}