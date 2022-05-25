import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magnise_test_project/crypto_controller.dart';
import 'package:intl/intl.dart';
// import 'dart:math';

class CurrentRate extends StatelessWidget {
  const CurrentRate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CryptoController>(
        init: CryptoController(),
        builder: (cryptoController) {
          return Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const Text('Symbol:'),
                        cryptoController.pair != null
                            ? Text(cryptoController.pair!)
                            : const Text(''),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(children: [
                      const Text('Price:'),
                      cryptoController.currentRate?.rate != null
                          // cryptoController.webSocketData?.priceOpen != null
                          ? Text(
                              // '\$${cryptoController.webSocketData?.priceOpen.toStringAsFixed(2)}')
                              '\$${cryptoController.currentRate?.rate.toStringAsFixed(2)}')
                          : const Text(''),
                    ]),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Text('Time:'),
                        cryptoController.currentRate?.time != null
                            // cryptoController.webSocketData?.timeOpen != null
                            ? Text(DateFormat.MMMd('en_US').add_Hm().format(
                                DateTime.parse(
                                    cryptoController.currentRate!.time!
                                    // cryptoController.webSocketData!.timeOpen!
                                    ))) /*Text('Aug 7, 9:45 AM')*/
                            : const Text(''),
                      ],
                    ),
                  )
                ],
              ));
        });
  }
}
