import 'package:flutter/material.dart';
import 'package:weather_app/weather_data.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var client = WeatherData();

  var data;

  info() async {
    data = await client.getData('gaza');
    return data;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: FutureBuilder(
            future: info(),
            builder: (context, snapshot) {
              return Container(
                child: Column(
                  children: [
                    Container(
                      height: size.height * 0.75,
                      width: size.width,
                      padding: const EdgeInsets.only(top: 30),
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(40),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xff955cd1),
                            Color(0xff3fa2fa),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: [0.2, 0.85],
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "${data?.cityName}",
                            style: TextStyle(color: Colors.white, fontSize: 35),
                          ),

                          Text(
                            '${data?.localtime}',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          // Image.asset('assets/images/sunny.png',
                          //     width: size.width * 0.3),
                          Image.network(
                            'https:${data?.icon}',
                            width: size.width * 0.35,
                            fit: BoxFit.fill,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '${data?.condtion}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '${data?.temp}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 65,
                                fontWeight: FontWeight.w800),
                          ),
                          const SizedBox(height: 35),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/storm.jpg',
                                      width: size.width * .2,
                                    ),
                                    Text('${data?.wind} km/h',
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.white)),
                                    const Text('wind',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white)),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/humidity.png',
                                      width: size.width * .2,
                                    ),
                                    Text('${data?.humidity}',
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.white)),
                                    const Text('Humidity',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white)),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/wind.png',
                                      width: size.width * .2,
                                    ),
                                    Text('${data?.wind_dir}',
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.white)),
                                    const Text('Wind Direction',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                'Gust',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 17),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '${data?.gust} kp/h',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 23),
                              ),
                              const SizedBox(height: 15),
                              Text(
                                'Pressure',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 17),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '${data?.pressure} hpa',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 23),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                'UV',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 17),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '${data?.uv}',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 23),
                              ),
                              const SizedBox(height: 15),
                              Text(
                                'Precipictation',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 17),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '${data?.pricipe}mm',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 23),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                'Wind',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 17),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '${data?.wind} kp/h',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 23),
                              ),
                              const SizedBox(height: 15),
                              Text(
                                'Last Update',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 17),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '${data?.last_update}',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 23),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }));
  }
}
