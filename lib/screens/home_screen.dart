import 'package:bluetooth_printer/Helper/colors.dart';
import 'package:bluetooth_printer/Helper/route_url.dart';
import 'package:bluetooth_printer/controllers/keeper_controller.dart';
import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final keeperController = Get.find<KeeperController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR_LIGHT,
        title: const Text("Bluetooth Printer", style: TextStyle(color: WHITE)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                Get.toNamed(printerSetting);
              },
              color: PRIMARY_COLOR_LIGHT,
              child: const Text("Printer Setting", style: TextStyle(color: WHITE),),
            ),
            MaterialButton(
              onPressed: () {
                printPaper();
              },
              color: PRIMARY_COLOR_LIGHT,
              child: const Text("Print", style: TextStyle(color: WHITE),),
            ),
          ],
        ),
      ),
    );
  }

  Future<List<int>> printPaper() async {
    List<int> bytes = [];
    // Using default profile
    final profile = await CapabilityProfile.load();
    final generator = Generator(
        keeperController.optionPrintType.value == "58 mm"
            ? PaperSize.mm58
            : PaperSize.mm80,
        profile);
    bytes += generator.reset();


    bytes += generator.text(
      'Assalamu Alaikum',
      styles: const PosStyles(
        bold: true,
        align: PosAlign.center,
        width: PosTextSize.size2,
        height: PosTextSize.size2,
      ),
    );

    // Add a horizontal line
    bytes += generator.hr(); // Add a horizontal line

    bytes += generator.feed(2);
    bytes += generator.cut();

    await PrintBluetoothThermal.writeBytes(bytes);
    return bytes;
  }

}
