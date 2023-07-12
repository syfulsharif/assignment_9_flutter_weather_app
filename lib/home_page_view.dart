import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weatherapp/style.dart';
import 'package:weatherapp/api_key.dart';
import 'package:http/http.dart';
import 'package:weatherapp/weatherData.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  Map<String, dynamic> fetchedData = {};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWeatherData();
    // print(fetchedData);
  }

  Future<void> getWeatherData() async {
    Response response = await get(
      Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=Chittagong&appid=$myApiKey&units=metric'),
    );
    final Map<String, dynamic> decodedWeatherData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      fetchedData.addAll(decodedWeatherData);
      // print(fetchedData['name']);
    }
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
      body: Stack(
        children: [
          screenBackground(context),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Text(fetchedData['name']),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                          'https://openweathermap.org/img/wn/${fetchedData['weather'][0]['icon']}@2x.png'),
                      Text('${fetchedData['main']['temp']}' ' ' '\u2103'),
                      const SizedBox(
                        width: 35.0,
                      ),
                      Column(
                        children: [
                          Text('Max' ' ''${fetchedData['main']['temp_max']}' ' '  '\u2103'),
                          Text('Min' ' ''${fetchedData['main']['temp_min']}' ' '  '\u2103')
                        ],
                      )
                    ],
                  ),
                  Text('${fetchedData['weather'][0]['main']}'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
