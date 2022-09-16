import 'package:flutter/material.dart';

Widget authButton({
  required Widget icon,
  required Widget label,
  double heights = 50,
  ButtonStyle? style,
  double minWidths = 0,
  ShapeBorder? shapes,
  Color? color,
  required void Function() onPress,
}) {
  return ElevatedButton.icon(
    onPressed: onPress,
    style: style,
    // height: heights,
    // minWidth: 50,
    // style: ,
    // shape: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(10),
    //     borderSide: const BorderSide(width: 0)),
    // color: color,
    icon: icon,
    label: label,
  );
}
