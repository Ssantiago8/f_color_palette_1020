import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

import '../../utils/color_utils.dart';
import '../widgets/color_palette.dart';

class ColorSelectionPage extends StatelessWidget {
  const ColorSelectionPage({Key? key}) : super(key: key);

  void showDialog() {
    Get.dialog(const AlertDialog(
      title: Text('Flutter'),
      content: Text('Dialog'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Color palette app'),
          actions: [
            IconButton(onPressed: showDialog, icon: Icon(Icons.info_outline))
          ],
        ),
        // https://colorhunt.co/
        body: (Align(
          alignment: Alignment.topLeft,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ColorPalette(
                  baseColor: 'A9E4EF',
                  baseColor1: '1CD6CE',
                  baseColor2: 'FEDB39',
                  baseColor3: 'D61C4E',
                  callback: (String) {},
                ),
                ColorPalette(
                  baseColor: '7A306C',
                  baseColor1: 'EF6351',
                  baseColor2: 'C4CAD0',
                  baseColor3: '878C8F',
                  callback: (String) {},
                ),
                ColorPalette(
                  baseColor: '1C1F33',
                  baseColor1: 'FF220C',
                  baseColor2: '9B7874',
                  baseColor3: 'EE6C4D',
                  callback: (String) {},
                ),
                ColorPalette(
                  baseColor: '42BFDD',
                  baseColor1: 'FF66B3',
                  baseColor2: 'F0F6F6',
                  baseColor3: 'F7DD72',
                  callback: (String) {},
                )
              ],
            ),
          ),
        )));
  }

  // está es la función que será llamada con cada click a un ColorPalette
  void showColor(String value) {
    Clipboard.setData(ClipboardData(text: value));
    Get.snackbar(
      'Color palette',
      'Valor copiado',
      backgroundColor: ColorUtils.FromHex(value),
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
