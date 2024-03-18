import 'package:bluetooth_printer/Helper/colors.dart';
import 'package:bluetooth_printer/Helper/route_url.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR_LIGHT,
        title: const Text("Bluetooth Printer", style: TextStyle(color: WHITE)),
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            Get.toNamed(printerSetting);
          },
          color: PRIMARY_COLOR_LIGHT,
          child: const Text("Printer Setting", style: TextStyle(color: WHITE),),
        ),
      ),
    );
  }
}
