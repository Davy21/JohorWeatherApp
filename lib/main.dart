import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';
import 'package:weather_my/apiModel/forecastResponse.dart';
import 'package:weather_my/service/weatherApi.dart';
import 'package:weather_my/town.dart';

import 'apiModel/locationResponse.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  WeatherAPI weatherAPI = WeatherAPI();
  Future<LocationResults> locResults;
  Future<ForecastResults> forecastResults;
  String town;
  String currentStatus;
  String weatherStatus;
  String dayStatus;
  RandomColor _randomColor; 
  Color backgroundColor;

  @override
  void initState() {
    super.initState();

    print('Initialize random color');
    _randomColor = RandomColor();
    backgroundColor = _randomColor.randomColor();

    print('Initialize variable');
    town = '';
    currentStatus = '';
    weatherStatus = '';
    dayStatus = '';

    print('Init started');
    //call city api
    locResults = weatherAPI.getCityList();
    locResults.then((value) {
      List<LocationDetail> johorDistrictList =
          value.results.where((x) => x.locationrootid == 'LOCATION:1').toList();

      Random rnd = new Random();
      int randNumber = rnd.nextInt(johorDistrictList.length);
      var locationid = johorDistrictList[randNumber].id;

      //call forecast api
      forecastResults = weatherAPI.getCityForecast(locationid);
      forecastResults.then((value) {
        setState(() {
          town = value.results[5].locationname;
          currentStatus = value.results[5].value;
          weatherStatus = value.results[5].attributes.code;
          dayStatus = value.results[5].attributes.when;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Johor Weather',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          //primarySwatch: backgroundColor,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text("Johor Districts Weather"),
              backgroundColor: backgroundColor,
            ),
            body: AnimatedContainer(
                color: backgroundColor,
                duration: Duration(seconds: 2),
                child: InkWell(
                  onTap: () {
                    //call city api
                    locResults = weatherAPI.getCityList();
                    locResults.then((value) {
                      List<LocationDetail> johorDistrictList = value.results
                          .where((x) => x.locationrootid == 'LOCATION:1')
                          .toList();

                      Random rnd = new Random();
                      int randNumber = rnd.nextInt(johorDistrictList.length);
                      var locationid = johorDistrictList[randNumber].id;

                      //call forecast api
                      forecastResults = weatherAPI.getCityForecast(locationid);
                      forecastResults.then((value) {
                        setState(() {
                          town = value.results[5].locationname;
                          currentStatus = value.results[5].value;
                          weatherStatus = value.results[5].attributes.code;
                          dayStatus = value.results[5].attributes.when;
                          backgroundColor = _randomColor.randomColor();
                        });
                      });
                    });
                  },
                  child: Town(
                    town: town,
                    currentStatus: currentStatus,
                    weatherStatus: weatherStatus,
                    dayStatus: dayStatus,
                  ),
                ))));
  }
}
