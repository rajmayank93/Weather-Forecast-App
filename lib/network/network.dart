import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_forecst/model/weather_model.dart';
import 'dart:async';
import '../model/weather_model.dart';

class WeatherApiClient{
  Future<Weather>? getCurrentWeather(String? location) async{
  var endpoint=Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location&appid=a0047d7550377a4054cdd3368f849e09&units=metric");

  var response = await http.get(endpoint);
  var body=jsonDecode(response.body);
  print(Weather.fromJson(body).cityName);
  return Weather.fromJson(body);

  }
}


