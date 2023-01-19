import 'dart:convert';

import 'package:uidesign01/user.dart';
import 'package:http/http.dart' as http;

class RestAPIService {
  String apiUrl = 'https://mocki.io/vi/ed0c6388-7a27-4c27-942b-f1b6b358178e';

  //future method to get all users from api url (response or error)
  Future<List<User>> getUsers() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return getUsersList(response.body);
    } else {
      throw Exception('Unable to fetch data');
    }
  }

  //convert response body => User object list
  List<User> getUsersList(String responseBody) {
    final parsedBody = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsedBody.map<User>((json) => User.fromJson(json)).toList();
  }
}
