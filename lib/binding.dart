import 'package:get/get.dart';
import 'package:magnise_test_project/crypto_controller.dart';

setupBindings() => {
      Get.lazyPut(() => CryptoController()),
    };
