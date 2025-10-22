import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:shopsy/data/model/product_model.dart';

class ProductRepo {
  Future<List<ProductModel>> loadProduct() async {
    final String response = await rootBundle.loadString(
      'assets/json/product_list.json',
    );
    List<dynamic> parsed = json.decode(response);
    return parsed.map((json) => ProductModel.fromJson(json)).toList();
  }
}
