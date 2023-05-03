import 'dart:developer';
import 'package:extra_edge/model/rocket_list_model.dart';
import 'package:extra_edge/network_service/api_const.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RocketListProvider with ChangeNotifier {
  List<RocketListModel> _rocketList = [];

  bool isLoading = false;

  List<RocketListModel> get rocketList => _rocketList;

  Future<RocketListModel?> fetchRocketList() async {
    isLoading = true;
    notifyListeners();
    log("Hello------");
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
    };
    final response =
        await http.get(Uri.parse(UrlConst.getRocket), headers: requestHeaders);
    log(UrlConst.getRocket);
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      log(jsonData.toString());
      isLoading = false;
      _rocketList =
          jsonData.map((json) => RocketListModel.fromJson(json)).toList();

//      log(_data.toString());
    } else {
      log(response.body);
      throw Exception('Failed');
    }
    notifyListeners();
  }
}
