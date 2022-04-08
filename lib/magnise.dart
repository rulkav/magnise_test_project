import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magnise_test_project/binding.dart';
import 'package:magnise_test_project/home.dart';

class Magnise extends StatelessWidget {
  const Magnise({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(() => setupBindings()),
      title: 'Flutter CryptoCurrency reader',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeWidget(),
    );
  }
}
