import 'package:flutter/material.dart';
import 'package:naver_map/route_bar.dart';
import 'package:naver_map/route_line.dart';
import 'package:naver_map/popup_route_box.dart';
import 'package:timelines/timelines.dart';
import 'models/model_itinerary.dart';

Widget buildRouteBox(
    BuildContext context,
    int totalFare,
    int totalTime,
    int totalWalkTime,
    List<int> sectionTimes,
    List<String> routeColors,
    List<String> modes,
    List<String> routes,
    ) {
  List<Color> colors = routeColors.map((colorString) {
    if (colorString == '0') {
      return Colors.transparent;
    } else {
      return Color(int.parse(colorString, radix: 16) + 0xFF000000);
    }
  }).toList();

  return GestureDetector(
    onTap: () {
      showDialog(
        builder: (context) => PopupRouteBox(
          totalFare: totalFare,
          totalTime: totalTime,
          totalWalkTime: totalWalkTime,
          sectionTimes: sectionTimes,
          routeColors: routeColors,
          modes: modes,
          routes: routes, 
        ), context: context, // Replace PopupRouteBox with the actual popup widget you want to display
      );
    },
    child: Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${totalTime ~/ 60} 분',
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '요금: $totalFare 원      도보거리: ${totalWalkTime ~/ 60} 분',
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          buildFlexibleContainers(sectionTimes, colors, modes),
          const SizedBox(height: 20),
          Container(
            height: 1,
            color: const Color(0x9F9F9FFF),
          ),
          buildRouteLine(),
        ],
      ),
    ),
  );
}

