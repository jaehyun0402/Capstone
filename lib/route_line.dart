import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

const kTileHeight = 50.0;

Widget buildRouteLine(// List<String> routes,
    ) {
  int item_count = 4; // dot 개수
  double spacce = 40.0; //dot 끼리 간격
  final data = _TimelineStatus.values;
  return SizedBox(
    height: 300,
    child: Container(
      child: Timeline.tileBuilder(
        theme: TimelineThemeData(
          nodePosition: 0,
          connectorTheme: const ConnectorThemeData(
            thickness: 3.0,
            color: Color(0xffd3d3d3),
          ),
          indicatorTheme: const IndicatorThemeData(
            size: 20.0,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        builder: TimelineTileBuilder.connected(
          contentsBuilder: (_, __) => _EmptyContents(),
          connectorBuilder: (_, index, __) {
            if (index == 0) {
              return const SolidLineConnector(color: Color(0xff6a6a6a)); //라인 건드는 곳
            } else {
              return const SolidLineConnector();
            }
          },
          indicatorBuilder: (_, index) {
            switch (data[index]) {
              case _TimelineStatus.walk:
                return const DotIndicator(
                  color: Color(0xff6a6a6a),
                  child: Icon(
                    Icons.directions_walk,
                    color: Colors.white,
                    size: 14.0,
                  ),
                );
              case _TimelineStatus.bus:
                return const DotIndicator(
                  color: Color(0xff193fcc),
                  child: Icon(
                    Icons.directions_bus,
                    size: 14.0,
                    color: Colors.white,
                  ),
                );
              case _TimelineStatus.subway:
                return const DotIndicator(
                  color: Color(0xff19cc52),
                  child: Icon(
                    Icons.directions_subway,
                    size: 14.0,
                    color: Colors.white,
                  ),
                );
              case _TimelineStatus.transfer:
                return const DotIndicator(
                  color: Color(0xff6a6a6a),
                  child: Icon(
                    Icons.directions_walk,
                    color: Colors.white,
                    size: 14.0,
                  ),
                );
              default:
                return const OutlinedDotIndicator(
                  color: Color(0xffbabdc0),
                  backgroundColor: Color(0xffe6e7e9),
                );
            }
          },
          itemExtentBuilder: (_, __) => kTileHeight,
          itemCount: data.length,
        ),
      ),
    ),
  );
}

enum _TimelineStatus {
  walk,
  bus,
  transfer,
  subway,
}

class _EmptyContents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.0),
      height: 10.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.0),
        color: Color(0xffe6e7e9),
      ),
    );
  }
}
