import 'dart:convert';

import 'package:bonniemap/models/map_geocode_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const query = '테라로사';
  static const baseUrl = 'https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?query=$query';

  static Future<MapGeocodeModel> getLocationList() async {
    final url = Uri.parse(baseUrl);
    final res = await http.get(url);
    if (res.statusCode == 200) {
      final Map<String, dynamic> location = jsonDecode(res.body);
      return MapGeocodeModel.fromJson(location);
    }
    throw Error();
  }
}
