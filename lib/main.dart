import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:naver_map/route_bar.dart';
import 'package:naver_map/route_box1.dart';
import 'package:stacked_bar_chart/stacked_bar_chart.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('앱임')),
        body: SingleChildScrollView(
          child: Column(
            children: [
              buildRouteBox(context, 1350, 2149, 592, [143, 894, 181, 663, 268],
                  ["0", "ff0068B7", "0", "ff003DA5", "0"],["WALK" ,"BUS" ,"TRANSFER","SUBWAY","WALK"],["간선:151","수도권 4호선","시외:3007"]),
              buildRouteBox(context, 1500, 2500, 750, [200, 900, 250, 750, 400],
                  ["0", "ff00BFFF", "0", "ff0066FF", "0"],["WALK" ,"BUS" ,"TRANSFER","SUBWAY","WALK"],["간선:151","수도권 경의중앙선","시외:3007"]),
              buildRouteBox(context, 1200, 2000, 500, [100, 700, 300, 600, 300],
                  ["0", "ffFF6347", "0", "ffFA8072", "0"],["WALK" ,"BUS" ,"TRANSFER","SUBWAY","WALK"],["간선:151","수도권 9호선","시외:1007"]),
              buildRouteBox(context, 1350, 2149, 592, [143, 894, 181, 663, 268],
                  ["0", "ff0068B7", "0", "ff003DA5", "0"],["WALK" ,"BUS" ,"TRANSFER","SUBWAY","WALK"],["시내:11","수도권 3호선","시외:3008"]),
              buildRouteBox(context, 1350, 2149, 592, [143, 894, 181, 663, 268],
                  ["0", "ff0068B7", "0", "ff003DA5", "0"],["WALK" ,"BUS" ,"TRANSFER","SUBWAY","WALK"],["간선:151","수도권 2호선","시외:8800"]),
            ],
          ),
        ),
      ),
    );
  }
}
