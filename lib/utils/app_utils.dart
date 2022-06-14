import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:real_estate/models/properties.dart';
import 'package:real_estate/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/api_strigns.dart';

class AppUtils {
  var client = http.Client();

  static Future<User> getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    const url = 'https://odczone.com/api/user';
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    final responseData = json.decode(response.body);

    if (responseData == null) {
      return User();
    }

    print('Current User is: $responseData');
    User user = User(
      first_name: responseData['first_name'],
      last_name: responseData['last_name'],
      id: responseData['id'],
      email: responseData['email'],
    );
    return user;
  }

  Future<Properties> getProperties(String get) async {
    String? url;
    if (get == 'RR') {
      url = Strings.rentResidentialUrl;
    } else if (get == 'SR') {
      url = Strings.saleResidentialUrl;
    } else if (get == 'RC') {
      url = Strings.rentCommercialUrl;
    } else if (get == 'SC') {
      url = Strings.saleCommercialUrl;
    }
    var response = await client.get(
      Uri.parse(url!),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    var propertiesModel = null;

    try {
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        propertiesModel = Properties.fromJson(jsonMap);
      }
    } catch (exception) {
      print(exception);
      return propertiesModel;
    }

    return propertiesModel;
  }

  Future<Properties> searchProperties(String get) async {
    var response = await client.get(
      Uri.parse('https://odczone.com/properties?k=$get&is_searching=1'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    var propertiesModel = null;

    try {
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        propertiesModel = Properties.fromJson(jsonMap);
      }
    } catch (exception) {
      print(exception);
      return propertiesModel;
    }

    return propertiesModel;
  }

  static const _chars = '1234567890';
  static Random _rnd = Random();

  static String getRandomString(int length) =>
      String.fromCharCodes(Iterable.generate(
          length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}
