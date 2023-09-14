import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils.dart';

class HttpServices {
  Map<String, String> headers = {
    "X-RapidAPI-Host": rapidApiHost,
    "X-RapidAPI-Key": apiKey,
  };

  Future<dynamic> getExerciseList() async {
    try {
      var response = await http.get(
        Uri.parse("${baseApiUrl}exercises"),
        headers: headers,
      );

      if (response.statusCode == 200) {
        var result = json.decode(response.body);

        return result;
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<dynamic> getExerciseDetails({required String id}) async {
    try {
      var response = await http.get(
        Uri.parse("${baseApiUrl}exercises/exercise/$id"),
        headers: headers,
      );

      if (response.statusCode == 200) {
        var result = json.decode(response.body);

        return result;
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
