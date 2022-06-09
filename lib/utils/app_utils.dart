import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:real_estate/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppUtils {
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

  static const _chars = '1234567890';
  static Random _rnd = Random();

  static String getRandomString(int length) =>
      String.fromCharCodes(Iterable.generate(
          length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}
