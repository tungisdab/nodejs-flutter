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
            name: value['pname'],
            price: value['pprice'],
            desc: value['pdes'],
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
}