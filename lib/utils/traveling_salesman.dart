import 'package:innerlibs/innerlibs.dart';

/// Return the speed in meters per second
double calculateSpeed(Distance distance, LatLngTime from, LatLngTime to, [LengthUnit unit = LengthUnit.Meter]) {
  var d = distance.as(unit, from, to);
  Duration timeDifference = to.timestamp.difference(from.timestamp);
  double timeInSeconds = timeDifference.inSeconds.toDouble();
  return d / timeInSeconds;
}

/// Order a list of points using the Traveling Salesman Problem algorithm on a [LatLng] property of points
///
List<T> orderByPropertyTSP<T>(List<T> points, LatitudeLongitude? Function(T) latitudeLongitude, [Distance distance = const Distance()]) {
  var p = points.whereNot((x) => latitudeLongitude(x) == null).toList();
  if (p.isEmpty) return [];

  List<T> ordered = [p.first];
  Set<int> visited = {};

  while (ordered.length < p.length) {
    T last = ordered.last;
    double minDistance = double.infinity;
    int nextIndex = -1;

    for (int i = 0; i < p.length; i++) {
      if (!visited.contains(i)) {
        double cmDistance = distance.as(
          LengthUnit.Millimeter,
          latitudeLongitude(last)!,
          latitudeLongitude(p[i])!,
        );
        if (cmDistance < minDistance) {
          minDistance = cmDistance;
          nextIndex = i;
        }
      }
    }

    if (nextIndex != -1) {
      ordered.add(points[nextIndex]);
      visited.add(nextIndex);
    }
  }

  for (var i in points.whereNot(ordered.contains)) {
    ordered.add(i);
  }

  return ordered;
}

/// Order a list of [LatLng] points using the Traveling Salesman Problem algorithm
List<T> orderByTSP<T extends LatLng>(List<T> points, [Distance distance = const Distance()]) => orderByPropertyTSP(points, (x) => x, distance);

class LatLngTime extends LatLng {
  final DateTime timestamp;
  LatLngTime(super.latitude, super.longitude, [date? timestamp]) : timestamp = timestamp ?? DateTime.now();
}
