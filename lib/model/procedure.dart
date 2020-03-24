import 'package:intl/intl.dart';

import 'Latlng.dart';

class Procedure {
  final int id;
  final name;
  final hospitalName;
  final lastUpdated;
  final double charge;
  final Latlng latlng;
  final int hospitalId;

  double get distance => 6.7;

  Procedure(
    this.id, {
    this.name,
    this.hospitalName,
    this.lastUpdated,
    this.charge,
    this.latlng,
    this.hospitalId,
  });

  factory Procedure.fromJson(Map<String, dynamic> item) {
    return Procedure(item["id"],
        name: item["name"],
        hospitalName: item["hospital_name"],
        charge: item["charge"],
        lastUpdated: DateFormat.yMMMMd("en_US")
            .format(DateTime.parse(item["last_updated"])),
        latlng: Latlng(double.parse(item["lat"]), double.parse(item["lon"])),
        hospitalId: item['hospital']);
  }

  @override
  String toString() {
    return 'Procedure{id: $id, name: $name, hospitalName: $hospitalName, lastUpdated: $lastUpdated, distance: $distance, charge: $charge}';
  }
}

// [{
//     "id": 1,
//     "name": "Heart Diagnosis",
//     "charge": 1200.0,
//     "hospital": 1,
//     "last_updated": "2020-03-22",
//     "hospital_name": "Alton Memorial Hospital",
//     "lat": "46.0",
//     "lon": "87.0"
// },]
