import 'package:flutter/material.dart';

class ProductionTile extends StatefulWidget {
  var title;
  ProductionTile({Key? key, this.title}) : super(key: key);

  @override
  _ProductionTileState createState() => _ProductionTileState();
}

class _ProductionTileState extends State<ProductionTile> {
  @override
  Widget build(BuildContext context) {

    Color textColor = Color(0xffD2480A);
    Color subTextColor = Color(0xff999999);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
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
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 8),
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
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
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
                    "Total Payee",
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
            padding: const EdgeInsets.only(top: 8),
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
                    "Total Amount",
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
