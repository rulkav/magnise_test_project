import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magnise_test_project/crypto_controller.dart';
import 'package:magnise_test_project/current_rate.dart';
import 'package:magnise_test_project/history_chart.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final TextEditingController pairController = TextEditingController();
    // CryptoController cryptoController = Get.find();
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text('Criptocurrency rate'),
        // ),
        body: GetBuilder<CryptoController>(
            init: CryptoController(),
            builder: (cryptoController) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              child: TextField(
                            textCapitalization: TextCapitalization.characters,
                            controller: cryptoController.pairController,
                            cursorColor: Colors.black,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 0),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.black)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.black))),
                          )),
                          const SizedBox(width: 15),
                          GestureDetector(
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white),
                              child: const Text('Subscribe'),
                            ),
                            onTap: () {
                              // cryptoController.getCurrentCurrencyRateByPair(
                              //     pair: pairController.text);
                              cryptoController.pair =
                                  cryptoController.pairController.text;
                              cryptoController.closeConnect().then((value) =>
                                  Future.delayed(
                                      const Duration(milliseconds: 500),
                                      () => cryptoController.initConnect().then(
                                          (value) =>
                                              cryptoController.sendHello())));
                              cryptoController.getHistoryCurrencyRateByPair(
                                  pair: cryptoController.pairController.text);
                            },
                          ),
                          // TextButton(
                          //     onPressed: () => cryptoController.closeConnect(),
                          //     child: Text('Close'))
                        ],
                      ),
                      const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text('Market data:')),
                      const CurrentRate(),
                      const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text('Charting data:')),
                      cryptoController.historyCrypto != null
                          ? HistoryChart(
                              data: cryptoController.historyCrypto!,
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
