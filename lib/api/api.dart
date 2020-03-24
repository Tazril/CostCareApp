import 'package:http/http.dart' as http;
import 'package:cost_care/model/hospital.dart';
import 'dart:convert';

import 'package:cost_care/model/procedure.dart';

Future<List<Procedure>> getProcedureList() async {
  var url = "http://tazril.pythonanywhere.com/procedure/";
  var response = await http.get(url);
  if (response.statusCode == 200) {
    final procedures = <Procedure>[];
    for (var item in jsonDecode(response.body)) {
      procedures.add(Procedure.fromJson(item));
    }
    return procedures;
  }
  throw Exception('Unable to get Procedure List Data');
}

Future<Hospital> getHospital(int id) async {
  var url = "http://tazril.pythonanywhere.com/hospital/$id/";
  var response = await http.get(url);
  if (response.statusCode == 200) {
    return Hospital.fromJson(jsonDecode(response.body));
  }
  throw Exception('Unable to get Hospital Data');
}
