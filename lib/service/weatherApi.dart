import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:weather_my/apiModel/forecastResponse.dart';
import 'package:weather_my/apiModel/locationResponse.dart';
import 'package:weather_my/service/httpClient.dart';

const String apiKey = 'METToken 3b1ff2d29e88e646229c285cc363c2b6797659fe';
const String cityApiUrl = 'https://api.met.gov.my/v2/locations?locationcategoryid=DISTRICT';
const String forecastApiUrl = 'https://api.met.gov.my/v2/data?';
const String forecastParameter1 = 'datasetid=FORECAST&';
const String forecastParameter2 = 'datacategoryid=GENERAL&';
const String forecastParameter3 = 'locationid=';
//today date
DateTime now = new DateTime.now();
DateFormat formmatter = new DateFormat('yyyy-MM-dd');
String todayDate = formmatter.format(now);
//date format yyyy-mm-dd
String forecastParameter4 = 'start_date=' + todayDate + '&';
String forecastParameter5 = 'end_date=' + todayDate;

class WeatherAPI {
  Future<LocationResults> getCityList() async {
    HttpClient client = HttpClient(
      url:cityApiUrl,
      authToken: apiKey
    ); 

    var response = await client.getData();
    return LocationResults.fromJson(json.decode(response));
  }

  Future<ForecastResults> getCityForecast(String locationId) async {

    String url = forecastApiUrl + forecastParameter1 + forecastParameter2 + 
    forecastParameter3 + locationId + "&" + forecastParameter4 + forecastParameter5;
    //print(forecastParameter5);
    HttpClient client = HttpClient(
      url:url,
      authToken: apiKey
    ); 

    var response = await client.getData();
    return ForecastResults.fromJson(json.decode(response));
  }
}