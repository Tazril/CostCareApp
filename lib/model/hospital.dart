import 'Latlng.dart';

class Hospital {
  final int id;
  final name;
  final webUrl;
  final int contactNum;
  final queryUrl;
  final Latlng latlng;

  Hospital(this.id,
      {this.name, this.webUrl, this.contactNum, this.queryUrl, this.latlng});

  factory Hospital.fromJson(Map<String, dynamic> item) {
    return Hospital(
      item["id"],
      name: item["name"],
      queryUrl: item["query_url"],
      webUrl: item["web_url"],
      contactNum: item["contact_num"],
      latlng: Latlng(item["lat"], item["lon"]),
    );
  }
}

// {
//     "id": 1,
//     "name": "Alton Memorial Hospital",
//     "web_url": "https://www.altonmemorialhospital.org/",
//     "procedures": [
//         "Heart Diagnosis"
//     ],
//     "contact_num": 8818100401,
//     "query_url": "https://www.bjc.org/For-Patients-Visitors/Financial-Assistance-Billing-Resources",
//     "lat": 46.0,
//     "lon": 87.0
// }
