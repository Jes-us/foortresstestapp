import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../data/models/business_model.dart';

class BusinessService {
  final http.Client client;

  BusinessService(this.client);

  Future<List<BusinessModel>> listBusiness() async {
    final response = await client
        .get(Uri.parse('https://business-hours-api.onrender.com/businesses'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => BusinessModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load businesses');
    }
  }
}
