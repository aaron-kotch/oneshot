import 'package:flutter/material.dart';

class SubBudgetTile extends StatefulWidget {

  SubBudgetTile({Key? key, required this.title, required this.payee, required this.amount}) : super(key: key);

  final String title;
  final String payee;
  final String amount;

  @override
  _SubBudgetTileState createState() => _SubBudgetTileState();
}

class _SubBudgetTileState extends State<SubBudgetTile> {
  @override
  Widget build(BuildContext context) {

    Color textColor = Color(0xffD2480A);
    Color subTextColor = Color(0xff999999);

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: textColor,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 12, right: 8),
                  child: Icon(
                    Icons.info_outline,
                    size: 12,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "100-1",
                  style: TextStyle(
                    fontFamily: "SegoeUI",
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: subTextColor,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.person,
                  size: 15,
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    widget.payee,
                    style: TextStyle(
                      fontFamily: "SegoeUI",
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: subTextColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ImageIcon(
                  AssetImage("assets/icons/dollar.png"),
                  size: 15,
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    widget.amount,
                    style: TextStyle(
                      fontFamily: "SegoeUI",
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: subTextColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
