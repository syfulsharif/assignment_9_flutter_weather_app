import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weatherapp/api_key.dart';
import 'package:http/http.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  bool inProgress = false;
  Map fetchedData = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWeatherData();
    // print(fetchedData);
  }

  void getWeatherData() async {
    bool inProgress = true;
    Response response = await get(
      Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=Chittagong&appid=$myApiKey&units=metric'),
    );
    final Map<String, dynamic> decodedWeatherData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      fetchedData.addAll(decodedWeatherData);
      // print(fetchedData['name']);
    } else {}
    inProgress = false;
    setState(() {});
    // return decodedWeatherData;
    // print(response.body);
    // var weatherImageSrc = 'https://openweathermap.org/img/wn/${decodedWeatherData['weather'][0]['icon']}@2x.png';
    // print(decodedWeatherData['weather'][0]['main']);
  }

  //API https://api.openweathermap.org/data/2.5/weather?q=Chittagong&appid=myAPI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Flutter Weather',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Icon(
                  (Icons.settings),
                  color: Colors.white,
                ),
                SizedBox(
                  width: 20.0,
                ),
                Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ],
            )
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: inProgress
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              children: [
                Image.asset(
                  'assets/images/bg_g.jpg',
                  fit: BoxFit.fill,
                  height: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 50.0,
                        ),
                        Text(
                          fetchedData['name'],
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.network(
                              'https://openweathermap.org/img/wn/${fetchedData['weather'][0]['icon']}@2x.png',
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              '${fetchedData['main']['temp'].toString()}'
                              ' '
                              '\u2103',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 25.0),
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            Column(
                              children: [
                                Text(
                                  'Max'
                                  ' '
                                  '${fetchedData['main']['temp_max'].toString()}'
                                  ' '
                                  '\u2103',
                                  style: const TextStyle(color: Colors.white),
                                ),
                                Text(
                                    'Min'
                                    ' '
                                    '${fetchedData['main']['temp_min'].toString()}'
                                    ' '
                                    '\u2103',
                                    style: const TextStyle(color: Colors.white))
                              ],
                            )
                          ],
                        ),
                        Text(
                          '${fetchedData['weather'][0]['main']}',
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
