class Weather {
  var cityName;
  var icon;
  var condtion;
  var temp;
  var wind;
  var humidity;
  var wind_dir;
  var gust;
  var uv;
  var pressure;
  var pricipe;
  var last_update;
  var localtime;

  Weather({
    required this.cityName,
    required this.icon,
    required this.condtion,
    required this.temp,
    required this.wind,
    required this.humidity,
    required this.wind_dir,
    required this.gust,
    required this.uv,
    required this.pressure,
    required this.pricipe,
    required this.last_update,
    this.localtime
  });

  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json['location']['name'];
    icon = json['current']['condition']['icon'];
    condtion = json['current']['condition']['text'];
    temp = json['current']['temp_c'];
    wind = json['current']['wind_kph'];
    humidity = json['current']['humidity'];
    wind_dir = json['current']['wind_dir'];
    gust = json['current']['gust_kph'];
    uv = json['current']['uv'];
    pressure = json['current']['pressure_in'];
    pricipe = json['current']['precip_in'];
    last_update = json['current']['last_updated'];
    localtime = json['location']['localtime'];
  }
}
