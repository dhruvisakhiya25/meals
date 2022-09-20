// ignore_for_file: file_names

import 'package:meals/Network/export.dart';

Widget slideLeftBackground() {
  return Container(
    color: red,
    child: Align(
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children:  <Widget>[
          Icon(
           icDelete,
            color: white,
          ),
          Text(
          delete ,
            style: TextStyle(
              color: white,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.right,
          ),
          SizedBox(width: 20),
        ],
      ),
    ),
  );
}
