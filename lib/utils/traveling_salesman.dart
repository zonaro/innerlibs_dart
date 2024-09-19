import 'dart:math';

// Calculate the distance between two points on the Earth using Haversine formula
double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
  const R = 6371000; // Radius of the Earth in meters
  double dLat = (lat2 - lat1) * pi / 180.0;
  double dLon = (lon2 - lon1) * pi / 180.0;

  double a = sin(dLat / 2) * sin(dLat / 2) + cos(lat1 * pi / 180.0) * cos(lat2 * pi / 180.0) * sin(dLon / 2) * sin(dLon / 2);
  double c = 2 * atan2(sqrt(a), sqrt(1 - a));
  double distance = R * c;

  return distance; // Distance in meters
}

/// Return the speed in meters per second
double calculateSpeed(double fromLatitude, double fromLongitude, DateTime fromDatetime, double toLatitude, double toLongitude, DateTime toDatetime) {
  double distance = calculateDistance(fromLatitude, fromLongitude, toLatitude, toLongitude);
  Duration timeDifference = toDatetime.difference(fromDatetime);
  double timeInSeconds = timeDifference.inSeconds.toDouble();

//  double speedKilometersPerHour = (speedMetersPerSecond * 3600) / 1000;

  return distance / timeInSeconds;
}

double kilometersPerHourToMetersPerSecond(double kilometersPerHour) {
  return kilometersToMeters(kilometersPerHour) / 3600;
}

double kilometersToMeters(double kilometers) {
  return kilometers * 1000;
}

double metersPerSecondToKilometersPerHour(double metersPerSecond) {
  return metersToKilometers(metersPerSecond) * 3600;
}

double metersToKilometers(double meters) {
  return meters / 1000;
}

/// Order a list of points using the Traveling Salesman Problem algorithm
List<T> orderByTSP<T>(
  List<T> points,
  LatitudeLongitude Function(T) latitudeLongitude,
) {
  if (points.isEmpty) return [];

  List<T> ordered = [points.first];
  Set<int> visited = {0};

  while (ordered.length < points.length) {
    T last = ordered.last;
    double minDistance = double.infinity;
    int nextIndex = -1;

    for (int i = 0; i < points.length; i++) {
      if (!visited.contains(i)) {
        double distance = calculateDistance(
          latitudeLongitude(last).$1,
          latitudeLongitude(last).$2,
          latitudeLongitude(points[i]).$1,
          latitudeLongitude(points[i]).$2,
        );
        if (distance < minDistance) {
          minDistance = distance;
          nextIndex = i;
        }
      }
    }

    if (nextIndex != -1) {
      ordered.add(points[nextIndex]);
      visited.add(nextIndex);
    }
  }

  return ordered;
}

typedef LatitudeLongitude = (double, double);
