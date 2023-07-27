import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/weather_model.dart';

class WeatherData {
  Future<Weather> getData(String cityName) async {
    var uriCall = Uri.parse(
        'https://api.weatherapi.com/v1/current.json?key=ebe5aea404e44fb49f9135549232707%20&q=$cityName&q=Palestine&aqi=no');
        var response = await http.get(uriCall);
        var body = jsonDecode(response.body);
        return Weather.fromJson(body);
  }
}
