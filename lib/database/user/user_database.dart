import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ocwapp/models/user/user.dart';
import 'package:ocwapp/models/user/user_type.dart';
import 'package:ocwapp/serializers/serializers.dart';
import 'package:ocwapp/utils/globals.dart';

Future<String> insertUser(
    {@required String firstName,
    @required String vehicleDetails,
    @required String address,
    @required String pin,
    @required String mobileNo,
    @required String emailId,
    @required String city,
    @required String street,
    @required String password}) async {
  Map<String, String> body = {
    'mode': 'mobile_app_signup',
    'app_cust_name': firstName,
    'app_cust_add_2': address,
    'app_cust_pin_code': pin,
    'app_cust_vehicle_details': vehicleDetails,
    'app_cust_mobile_no': mobileNo,
    'app_cust_email_id': emailId,
    'app_cust_city': city,
    'app_cust_add_1': street,
    'app_cust_pass_word': password
  };
  body.removeWhere((String key, dynamic value) =>
      value == null || value == 'null' || value.isEmpty);

  print(body);

  http.post('$url', body: body).then((bb) {
    print('what ${bb.body}');
  });
  http.Response response = await http.post('$url', body: body);
//bzbzbzbbz
  print('response is ${response.body}');
  if (response.body.contains("Error")) {
    throw Exception(response.body);
  } else {
    print('response ${response.body}');
    return response.body;
  }
}

Future<String> updateUser(
    {@required String firstName,
    String lastName,
    @required String id,
    @required String userType,
    @required String address,
    @required String pin,
    @required String mobileNo,
    @required String emailId,
    @required String city,
    @required String street,
    @required String password}) async {
  Map<String, dynamic> body = {
    'mode': 'update-user.php',
    'id': id,
    'first_name': firstName,
    'last_name': lastName,
    'user_type': userType,
    'address': address,
    'PIN': pin,
    'mobile_no': mobileNo,
    'email_id': emailId,
    'city': city,
    'street': street,
    'password': password,
  };
  body.removeWhere((String key, dynamic value) =>
      value == null || value == 'null' || value.isEmpty);

  http.Response response = await http.post('$url', body: body);
  if (response.body.contains("Error")) {
    print('update ${response.body}');
    throw Exception('Unable To process');
  } else {
    return response.body;
  }
}

Future<User> login({String emailId, String password}) async {
  //TODO email id
  Map<String, String> body = {
    'mode': 'mobile_app_login',
    'app_cust_email_id': emailId,
    'app_cust_pass_word': password
  };
  http.post('$url', body: body).then((v){
    print('vgvgv ${v.body}');
  });
  var response = await http.post('$url', body: body);

  if (response.body.contains("Error")) {
    throw Exception('Unable To process');
  } else {
    try {
      User user = serializers.deserializeWith(
          User.serializer, json.decode(response.body));
      print('data $user');
      return user;
    } catch (e) {
      return null;
    }
  }
}

Future updateUserType({String id, UserType status, String parentId}) async {
  Map<String, String> body = {
    'mode': 'update-user-type.php',
    'id': id,
    'user_type': status.toString(),
    'parent_id': parentId
  };
  http.Response response =
      await http.post('$url/update-user-type.php', body: body);
  if (response.body.contains("Error")) {
    throw Exception('Unable To process');
  } else {
    return response.body;
  }
}

Future updatePin({String id, String parentId}) async {
  Map<String, String> body = {
    'mode': 'add-pin.php',
    'id': id,
    'parent_id': parentId,
  };
  http.Response response = await http.post('$url/add-pin.php', body: body);
  if (response.body.contains("Error")) {
    throw Exception('Unable To process');
  } else {
    return response.body;
  }
}

Future showBooking(
    {@required String firstName,
    @required String vehicleDetails,
    @required String address,
    @required String pin,
    @required String id,
    @required String mobileNo,
    @required String emailId,
    @required String city,
    @required String street,
    @required String password}) async {
  Map<String, dynamic> body = {
    'mode': 'mobile_app',
    'app_cust_name': firstName,
    'app_cust_id': id,
    'app_cust_add_2': address,
    'app_cust_pin_code': pin,
    'app_cust_vehicle_details': vehicleDetails,
    'app_cust_mobile_no': mobileNo,
    'app_cust_email_id': emailId,
    'app_cust_city': city,
    'app_cust_add_1': street,
    'app_cust_pass_word': password
  };

  http.Response response = await http.post('$url', body: body);
  print('data is ${response.body}');
  if (response.body == 'success') {
  } else {
    throw Exception(response.body);
  }
}

Future createSession() async {
  Map<String, String> body = {'mode': 'test'};
  http.Response response = await http.post('$url', body: body);
  print('data is ${response.body}');
}

Future<List<dynamic>> callLogDone(String num) async {
  Map<String, String> body = {'mode': 'call_logs',
    'app_cust_ivr_number':num,

  };
  http.Response response = await http.post(url, body: body);
  print('data is ${jsonDecode(response.body)}');
  return jsonDecode(response.body);
}
