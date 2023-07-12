import 'package:flutter/material.dart';
import 'package:weatherapp/style.dart';
import 'package:weatherapp/api_key.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
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
          Container(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Text('Chittagong'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network('https://openweathermap.org/img/wn/10d@2x.png'),
                        Text('27' + '\u2103'),
                        SizedBox(width: 25.0,),
                        Column(
                          children: [
                            Text('Max 25' + '\u2103'),
                            Text('Min 25' + '\u2103')
                          ],
                        )
                      ],
                    ),
                    Text('Thunder')
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
