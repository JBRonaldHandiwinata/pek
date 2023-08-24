import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:pek_mobile_app/constants/color.dart';
import 'package:pek_mobile_app/constants/urls.dart';
import 'package:pek_mobile_app/helper/dialog_helper.dart';


class ApiBase{
  final DialogHelper _dh = DialogHelper();

  Future<dynamic> post(String url, Map<String, dynamic> body, BuildContext bc, {dynamic headers = ""}) async{
    var responseJson;

    Loader.show(bc,
        progressIndicator: CircularProgressIndicator(backgroundColor: DARK_RED,),
        themeData: Theme.of(bc).copyWith(dialogBackgroundColor: WHITE)
    );
    try {
      var head =  {'Content-Type': 'application/json'};
      final response = await http.post(Uri.https(BASE_URL, url), body: json.encode(body), headers: head)
          .timeout(const Duration(seconds: 60));

      responseJson = _returnResponse(response, bc);
    } on SocketException {
      // ignore: use_build_context_synchronously
      _dh.modalError(bc, "No Internet connection");
    } on TimeoutException {
      // ignore: use_build_context_synchronously
      _dh.modalError(bc, "Timeout..!!");
    }
    Loader.hide();
    return responseJson;
  }

  dynamic _returnResponse(http.Response response, BuildContext bc) {
    print(response.toString());
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      default:
        _dh.modalError(bc, 'API Server Error with StatusCode : ${response.statusCode}');
        break;
    }
  }

}