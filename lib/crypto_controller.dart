import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:logger/logger.dart';
import 'package:magnise_test_project/base_rest_service.dart';
import 'package:magnise_test_project/models/crypto_model.dart';
import 'package:magnise_test_project/models/history_cripto_model.dart';
import 'package:magnise_test_project/models/web_socket_exchange_model.dart';
import 'package:magnise_test_project/models/web_socket_model.dart';
import 'package:magnise_test_project/providers/crypto_provider.dart';
import 'package:web_socket_channel/io.dart';

class CryptoController extends GetxController {
  List<HistoryCryptoModel>? historyCrypto;
  final log = Logger();
  final CryptoProvider _cryptoProvider = CryptoProvider();
  TextEditingController pairController = TextEditingController();
  CryptoModel? currentRate;
  IOWebSocketChannel? channel;
  final BaseRestService _api = BaseRestService();
  int second = 0;
  WebSocketCryptoModel_ohlcv? webSocketData;
  String? pair;
  // WebSocketCryptoModel_Exchange? webSocketData;
  // =WebSocketCryptoModel_ohlcv();

  @override
  onInit() {
    second = DateTime.now().millisecondsSinceEpoch;
    super.onInit();
  }

  Future getCurrentCurrencyRateByPair({required String pair}) async {
    log.i('Get current currency rate  ...');
    await _cryptoProvider.getCurrentCurrencyRate(
      pair: pair,
      onSuccess: (data) async {
        log.i('Response currency rate: $data');
        currentRate = CryptoModel.fromJson(data);
        update();
      },
      onError: (error) {
        log.e("Error $error");
      },
    );
  }

  Future getHistoryCurrencyRateByPair({required String pair}) async {
    log.i('Get current currency rate  ...');
    await _cryptoProvider.getHistoryCurrencyRate(
      pair: pair,
      onSuccess: (data) async {
        log.i('Response currency rate: $data');
        historyCrypto =
            (data as List).map((e) => HistoryCryptoModel.fromJson(e)).toList();
        update();
      },
      onError: (error) {
        log.e("Error $error");
      },
    );
  }

  Future initConnect() async {
    print('----------Start Client Socket ------->');

    channel = IOWebSocketChannel.connect(_api.webSocketUrl, headers: {});
    // sendHello();
    listenClientWebSocket();
  }

  Future closeConnect() async {
    print('----------Stop Client Socket ------->');

    await channel?.sink.close();
  }

  void sendHello() {
    print('----------Send Hello  to Client Socket ------->');
    channel?.sink.add(jsonEncode({
      "type": "hello",
      "apikey": _api.apiKey,
      "heartbeat": false,
      "subscribe_data_type": ["ohlcv"],
      "subscribe_filter_asset_id": [(pairController.text)]
    }));
  }

  void processMessage(dynamic msg) {
    if (true) {
      /* throw Exception("There is my Exception")*/
      print('disconnected');
      // connect();
    }
  }

  listenClientWebSocket() {
    channel?.stream.listen((rowData) {
      print(
          '$rowData reconnect after ${((DateTime.now().millisecondsSinceEpoch - second) / 1000).ceil()} seconds');
      second = DateTime.now().millisecondsSinceEpoch;
      if (rowData.toString().contains('2SEC')) {
        Map<String, dynamic> data = jsonDecode(rowData);
        webSocketData = WebSocketCryptoModel_ohlcv.fromJson(data);
        update();
      }
    }, onDone: null)
        // () => Future.delayed(Duration(milliseconds: 1000))
        //     .then((_) => initConnect()))
        ;
  }

  @override
  void dispose() {
    closeConnect();
    super.dispose();
  }
}
