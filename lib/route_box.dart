import 'package:flutter/material.dart';
import 'package:naver_map/route_bar.dart';
import 'package:naver_map/route_line.dart';
import 'package:timelines/timelines.dart';
import 'models/model_itinerary.dart';

Widget buildRouteBox(
  // 경로 박스 하나에 대한 위젯입니당 즉 하나의 itinerarity 인스턴스만 다루겠죵?
  int totalFare,
  int totalTime,
  int totalWalkTime,
  List<int> sectionTimes,
  List<String> routeColors,
  List<String> modes,
  List<String> routes, //간선:151, 수도권 4호선 등등
) {
  List<Color> colors = routeColors.map((colorString) {
    if (colorString == '0') {
      return Colors.transparent;
    } else {
      return Color(int.parse(colorString, radix: 16) + 0xFF000000);
    }
  }).toList();

  return Container(
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
          '요금 : $totalFare 원      도보거리 : ${totalWalkTime ~/ 60} 분',
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
        // Row(
        //   children: [
        //     buildRouteLine(routes)
        //   ],
        // ),
      ],
    ),
  );
}
