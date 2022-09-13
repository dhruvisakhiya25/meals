import 'package:flutter/material.dart';

Widget authButton({
  required Widget child,
  // double heights = 40,
  // double minWidths = 0,
  ShapeBorder? shapes,
  Color? color,
  required void Function() onPress,
}) {
  return MaterialButton(
    onPressed: onPress,
    // height: heights,
    // minWidth: minWidths,
    shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(width: 0)),
    color: color,
    child: child,
  );
}
