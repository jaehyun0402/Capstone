import 'model_start.dart';
import 'model_end.dart';
class Leg {
  @override
  String toString() {
    // TODO: implement toString
    return 'Leg{출발지: $start, 도착지: $end, 이동수단: $mode, 노선: $route, 이동 시간: $sectionTime}';
  }
  //n개의 이동에서의 출발지
  final Start start;
  //n번의 이동에서의 도착지
  final End end;
  //WALK,BUS,TRAIN 등등 이동 수단
  final String mode;
  //버스라면 버스 노선 번호, SUBWAY라면 수도권 1호선 이런 식..
  final String? route;
  //각 이동 간에 걸린 시간
  final int sectionTime;
  //각 이동 간에 이동 거리
  final int distance;

  const Leg({
    required this.start,
    required this.end,
    required this.mode,
    this.route,
    required this.sectionTime,
    required this.distance,
  });


  factory Leg.fromJson(Map<String,dynamic> json){
    final Map<String, dynamic> startData = json['start'];
    final Map<String, dynamic> endData = json['end'];
    return Leg(
      start: Start(
        name: startData['name'],
        lon: startData['lon'],
        lat: startData['lat'],
      ),
      end: End(
        name: endData['name'],
        lon: endData['lon'],
        lat: endData['lat'],
      ),
      mode: json['mode']??'',
      route : json['route']??'',
      sectionTime: json['sectionTime']??0,
      distance: json['distance']??'',
    );
  }
}