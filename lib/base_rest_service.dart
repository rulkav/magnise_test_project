import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:magnise_test_project/constant/app_url_request.dart';
import 'package:magnise_test_project/utils/utils.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class BaseRestService extends GetxController {
  String baseUrl = AppUrlRequestKeys.baseUrl;

  String webSocketUrl = AppUrlRequestKeys.webSocketUrl;

  String apiName = 'X-CoinAPI-Key';
  String apiKey = 'F96697CC-5111-49C3-844B-2B754E87E363';

  Map<String, String> headers = {
    'accept': 'application/json',
    'Accept-Encoding': 'deflate, gzip',
    'X-CoinAPI-Key': 'F96697CC-5111-49C3-844B-2B754E87E363'
  };

  Dio _dio() => Dio(BaseOptions(baseUrl: baseUrl, headers: headers))
    ..interceptors.add(Utils.dioLog);

  void get({
    String? url,
    Map<String, dynamic>? data,
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(DioError error)? onError,
  }) {
    // ignore: avoid_single_cascade_in_expression_statements
    _dio()
      ..get('$baseUrl$url', queryParameters: data).then((res) {
        if (onSuccess != null) onSuccess(res);
      }).catchError((error) {
        log('Error $error');
        parseStatusCodeError(
            error.response?.statusCode, error.response!.data['message']);
        if (onError != null) onError(error);
      });
  }

  String parseStatusCodeError(int status, String message) {
    switch (status) {
      case 400:
        _serverErrorPopup(400, message);
        return "invalid signature";
      case 404:
        _serverErrorPopup(404, message);
        return "User not found";
      case 500:
        _serverErrorPopup(500, message);
        return "Internal Server Error";
      case 501:
        _serverErrorPopup(501, message);
        return "Not Implemented";
      case 502:
        _serverErrorPopup(502, message);
        return "Bad Gateway";
      case 504:
        _serverErrorPopup(504, message);
        return "Gateway Timeout";
      case 408:
        _serverErrorPopup(408, message);
        return "Request Timeout";
      case 405:
        _serverErrorPopup(405, message);
        return "Method Not Allowed";
      case 401:
        _serverErrorPopup(401, message);
        return "Unauthorized";
      default:
        return "";
    }
  }

  void _serverErrorPopup(int code, String message) {
    Get.snackbar('Error Code: $code', 'Error Message: $message',
        duration: Duration(seconds: 5), snackPosition: SnackPosition.TOP);
  }
}
