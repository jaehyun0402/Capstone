import 'model_leg.dart';
class Itinerary {
  //총 요금
  final int totalFare;
  //총 걸린 시간
  final int totalTime;
  //총 도보 거리
  final int totalWalkDistance;
  //총 이동 거리
  final int totalDistance;
  //Leg를 담은 클래스
  final List<Leg> legs;
  @override
  String toString() {
    // TODO: implement toString
    return  'Itinerary{요금: $totalFare, 걸린 시간: $totalTime, 도보 거리:$totalWalkDistance, 이동거리: $totalDistance}';
  }
  const Itinerary({
    required this.totalFare,
    required this.totalTime,
    required this.totalWalkDistance,
    required this.totalDistance,
    required this.legs,
  });
}