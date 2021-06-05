import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:step_global_demo/modules/driver.dart';

class ServerHandler {

  static const String SERVER_API = 'http://54.206.105.236:9080/stepglobal/v1/drivers/';
  static const String AUTHORIZATION = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vc3RlcGdsb2JhbC5jb20vIiwic3ViIjoiVklDLTU1NTU1LTE5ODgwMTA3Iiwic2NvcGUiOiIiLCJqdGkiOiJmZGU4ZTRiNi05MTExLTRhNjQtODFhMS03ZWE3MWU4MTM4YzciLCJpYXQiOjE2MDk5ODczMTAsImV4cCI6MTYxMDA3MzcxMH0.UcLto3IlSDiecZ9MopIKDQR4G9s47Ze2J1Ysg1CYuww';
  static const String DRIVER_ID = 'VIC-55555-19880107';

  ///fetch driver data from the server
  static Future<Driver> fetchDriver() async {
    String url = SERVER_API + 'id/' + DRIVER_ID;
    final response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': AUTHORIZATION,
        'Platform-User': 'admin'
      },
    );
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      Map<String, dynamic> json = jsonDecode(response.body);
      return Driver.fromJson(json['data']);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load driver');
    }
  }

  ///post data to the server with updated driver
  static Future<void> updateDriver(Driver driver) async {
    String url = SERVER_API + DRIVER_ID  + '/profileupdate';
    final response = await http.put(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': AUTHORIZATION,
        'Platform-User': 'admin'
      },
      body: jsonEncode(<String, String>{
        "driver_firstname": driver.driver_firstname,
        "driver_lastname": driver.driver_lastname,
        "baseLocation": driver.baseLocation,
        "recordKeeper": driver.recordKeeper,
        "homeBaseTimeZone": driver.homeBaseTimeZone
      }),
    );
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      Map<String, dynamic> json = jsonDecode(response.body);
      print(json.toString());
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load driver');
    }
  }

  static Future<Driver> fetchDriverProfile() async {
    Driver driver = await fetchDriver();
    return driver;
  }



}