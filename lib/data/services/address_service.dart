import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import '../../features/personalization/models/states_cities_model.dart';

class AddressService {
  static Future<List<Wilaya>> loadWilayas() async {
    final String response = await rootBundle.loadString('assets/data/wilayas_communes.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => Wilaya.fromJson(json)).toList();
  }
}
