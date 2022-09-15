import 'package:meals/Network/export.dart';

Widget slideLeftBackground() {
  return Container(
    color: red,
    child: Align(
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const <Widget>[
          Icon(
            Icons.delete,
            color: white,
          ),
          Text(
            " Delete",
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
