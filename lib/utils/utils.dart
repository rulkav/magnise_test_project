import 'package:flutter/foundation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class Utils extends GetxController {
  static PrettyDioLogger dioLog = PrettyDioLogger(
      requestHeader: kReleaseMode ? false : true,
      requestBody: kReleaseMode ? false : true,
      responseBody: kReleaseMode ? false : true,
      responseHeader: kReleaseMode ? false : true,
      compact: kReleaseMode ? false : true,
      maxWidth: kReleaseMode ? 0 : 120);
}
