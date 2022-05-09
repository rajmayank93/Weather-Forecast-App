import 'package:flutter/material.dart';

Widget currentWeather(IconData icon, String temp, String location){
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon,
        color: Colors.orange,
        size: 64.0),
        SizedBox(height: 10.0,),
        Text(
          "$temp",
          style: TextStyle(
            fontSize: 40.0,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10.0,),
        Text(
          "$location",
          style: TextStyle(
            color: Colors.black45,
            fontSize: 20.0,
          ),
        )
      ],
    ),
  );
}