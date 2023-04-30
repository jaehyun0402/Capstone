import 'package:flutter/material.dart';
import 'package:naver_map/route_bar.dart';
import 'package:naver_map/route_line.dart';
import 'package:timelines/timelines.dart';
import 'models/model_itinerary.dart';

class PopupRouteBox extends StatelessWidget {
  final int totalFare;
  final int totalTime;
  final int totalWalkTime;
  final List<int> sectionTimes;
  final List<String> routeColors;
  final List<String> modes;
  final List<String> routes;


  PopupRouteBox({
    required this.totalFare,
    required this.totalTime,
    required this.totalWalkTime,
    required this.sectionTimes,
    required this.routeColors,
    required this.modes,
    required this.routes,
  });

  @override
  Widget build(BuildContext context) {
    List<Color> colors = routeColors.map((colorString) {
      if (colorString == '0') {
        return Colors.transparent;
      } else {
        return Color(int.parse(colorString, radix: 16) + 0xFF000000);
      }
    }).toList();

    return AlertDialog(
      //title: Text('상세 정보'),
      content: Container(
        width: 400,
        height: 600,
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red), //경계선
          //border: Border.fromBorderSide(BorderSide.none),
          borderRadius: BorderRadius.circular(10),
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
                fontSize: 12,
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
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Close'),
        ),
      ],
    );
  }
}
