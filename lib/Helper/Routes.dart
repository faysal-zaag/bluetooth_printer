import 'package:bluetooth_printer/Helper/route_url.dart';
import 'package:bluetooth_printer/screens/initial_screen.dart';
import 'package:bluetooth_printer/screens/printer_setting.dart';
import 'package:get/get.dart';

final List<GetPage<dynamic>> RoutePages = [
  GetPage(
    name: "/",
    page: () => const InitialScreen(),
    children: [
      GetPage(
        name: printerSetting,
        page: () => PrinterSetting(),
      ),
    ],
  )
];
