import 'package:flutter/material.dart';
import 'package:weather_forecst/additional_information.dart';
import 'package:weather_forecst/current_weather.dart';
import 'package:weather_forecst/model/weather_model.dart';
import 'package:weather_forecst/network/network.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class WeatherForecast extends StatefulWidget {
  const WeatherForecast({Key? key}) : super(key: key);

  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  WeatherApiClient client = WeatherApiClient();
  Weather? data;
  String _cityname="mumbai";
  late Future<Weather> forecastObject;

  Future<void> getData() async{
    data= await client.getCurrentWeather(_cityname);
  }
  @override
  void initState(){
    super.initState();
    forecastObject=WeatherApiClient().getCurrentWeather(_cityname)!;
    client.getCurrentWeather(_cityname);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200],
      // appBar: AppBar(
      //   backgroundColor: Colors.purple[400],
      //   elevation: 0.0,
      //   title: Text('Weather Forecast',
      //   style: TextStyle(
      //     color: Colors.black,
      //   ),),
      //   centerTitle: true,
      //   leading: IconButton(
      //     onPressed: (){},
      //     color: Colors.black,
      //     icon: Icon(Icons.menu),
      //   ),
      // ),
      body: FutureBuilder(
        future: getData(),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.done) {
            return ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20.0,),
                    textFieldView(),
                    currentWeather(
                        Icons.wb_sunny, "${data!.temp}", "${data!.cityName}"),
                    SizedBox(height: 60.0,),
                    Text(
                      "Additional Information",
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Divider(
                      color: Colors.red,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    additional_information("${data!.wind}", "${data!.humidity}",
                        "${data!.pressure}", "${data!.feels_like}"),

                  ],
                )
              ],
            );
          }
          else if(snapshot.connectionState==ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          }
          return Container();
        },
      )
    );
  }

  Widget textFieldView() {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          hintText: "Enter the City Name",
          prefixIcon: Icon(Icons.search,
          color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0)),
          contentPadding: EdgeInsets.all(8)

          ),
        onSubmitted: (value) {
        setState(() {
          _cityname=value;
          forecastObject=WeatherApiClient().getCurrentWeather(_cityname)!;
        });
        },

        ),
      );


  }
}
