import 'package:bluetooth_printer/Helper/Routes.dart';
import 'package:bluetooth_printer/controllers/keeper_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Bluetooth Printer',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      initialRoute: "/",
      getPages: RoutePages,
      fallbackLocale: const Locale('en', 'UK'),
      initialBinding: BindingsBuilder((){
        Get.put(KeeperController());
      }),
    );
  }
}