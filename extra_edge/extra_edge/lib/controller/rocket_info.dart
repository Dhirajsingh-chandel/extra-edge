import 'dart:developer';
import 'package:extra_edge/model/roket_info_model.dart';
import 'package:extra_edge/network_service/api_const.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RocketInfoProvider with ChangeNotifier {

  RocketInfoModel? rocketInfoModel;

  Future<RocketInfoModel?> fetchRocketInfo(String id) async {
    log("Hello------");
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
    };
    final response = await http.get(Uri.parse("${UrlConst.getRocketInfo}/$id"),
        headers: requestHeaders);
    log("${UrlConst.getRocketInfo}/$id");
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

     rocketInfoModel =  RocketInfoModel.fromJson(jsonData);


      log("---------------${rocketInfoModel!.engines!.number.toString()}");
  //    _rocketInfoList = jsonData.map((json) => RocketInfoModel.fromJson(json)).toList();

/*      var map = json.decode(response.body);
      Welcome modelObject = Welcome.fromJson(map);*/
    } else {
      log(response.body);
      throw Exception('Failed');
    }
    notifyListeners();
    return null;
  }
}
