import 'package:flutter/material.dart';

Widget buildFlexibleContainers(
    List<int> sectionTimes,
    List<Color> colors,
    List<String> modes,
    ) {
  assert(sectionTimes.length == colors.length);

  final List<Widget> containers = [];

  for (int i = 0; i < sectionTimes.length; i++) {
    Widget icon;
    switch (modes[i]) {
      case 'WALK':
      case 'TRANSFER':
        icon = const Icon(
          Icons.directions_walk,
          color: Colors.white,
          size: 18,
        );
        break;
      case 'BUS':
        icon = const Icon(
          Icons.directions_bus,
          color: Colors.white,
          size: 18,
        );
        break;
      case 'SUBWAY':
        icon = const Icon(
          Icons.directions_subway,
          color: Colors.white,
          size: 18,
        );
        break;
      default:
        icon = const SizedBox();
        break;
    }

    containers.add(
      Flexible(
        flex: sectionTimes[i],
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: colors[i],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  '${sectionTimes[i] ~/ 60} 분',
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
            if (colors[i] != Colors.transparent)
              Positioned(
                left: 0,
                top: (20 - 28) / 2,
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                  ),
                  child: Center(child: icon),
                ),
              ),
          ],
        ),
      ),
    );
  }

  return ClipRect(
    child: SizedBox(
      width: 400,
      height: 20,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: containers,
        ),
      ),
    ),
  );
}
