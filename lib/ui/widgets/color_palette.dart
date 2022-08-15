import 'package:flutter/material.dart';
import '../../utils/color_utils.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ColorPalette extends StatelessWidget {
  const ColorPalette({
    Key? key,
    required this.baseColor1,
    required this.baseColor2,
    required this.baseColor3,
    required this.baseColor,
    required this.callback,
  }) : super(key: key);

  // atributos de la clase, por ejemplo
  final String baseColor;
  final String baseColor1;
  final String baseColor2;
  final String baseColor3;

  // también se puede tener como un atributo un callback, necesiario ya que es un
  // widget sin estado, por ejemplo
  final Function(String) callback;

  @override
  Widget build(BuildContext context) {
    // padding para crear espacio alrededor del widget
    int color0 = int.parse('0xFF' + baseColor);
    int color1 = int.parse('0xFF' + baseColor1);
    int color2 = int.parse('0xFF' + baseColor2);
    int color3 = int.parse('0xFF' + baseColor3);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      // vamos a mostrar los elementos en un row
      child:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Expanded(
            flex: 4,
            child: InkWell(
                onTap: () {
                  showColor(baseColor);
                },
                child: Ink(height: 100, color: Color(color0)))),
        Expanded(
            flex: 3,
            child: InkWell(
                onTap: () {
                  showColor(baseColor1);
                },
                child: Ink(height: 100, color: Color(color1)))),
        Expanded(
            flex: 2,
            child: InkWell(
                onTap: () {
                  showColor(baseColor2);
                },
                child: Ink(height: 100, color: Color(color2)))),
        Expanded(
            flex: 1,
            child: InkWell(
                onTap: () {
                  showColor(baseColor3);
                },
                child: Ink(height: 100, color: Color(color3)))),
      ]),
    );
  }

  void showColor(String value) {
    Clipboard.setData(ClipboardData(text: value));
    Get.snackbar(
      'Color palette',
      'Valor copiado = $value',
      backgroundColor: ColorUtils.FromHex(value),
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
