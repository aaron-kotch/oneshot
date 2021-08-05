import 'package:flutter/material.dart';

class NewSubBudgetTile extends StatelessWidget {

  const NewSubBudgetTile({Key? key, required this.title, required this.payeeController, required this.amountController, required this.index, required this.list}) : super(key: key);

  final String title;
  final TextEditingController payeeController;
  final TextEditingController amountController;
  final List<dynamic> list;
  final int index;

  @override
  Widget build(BuildContext context) {

    final Color textColor = const Color(0xffD2480A);
    final Color subTextColor = const Color(0xff999999);
    final double width = MediaQuery.of(context).size.width;

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
                  this.title,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.person,
                size: 15,
                color: Colors.white,
              ),
              Container(
                padding: const EdgeInsets.only(left: 8),
                width: 200,
                child: TextField(
                  controller: this.payeeController,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    this.list[this.index].totalPayee = value;
                  },
                  style: TextStyle(
                    fontFamily: "SegoeUI",
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: subTextColor,
                  ),
                  decoration: InputDecoration(
                      hintText: "Total Payee",
                      hintStyle: TextStyle(
                        fontFamily: "SegoeUI",
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: subTextColor,
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.all(6)
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ImageIcon(
                AssetImage("assets/icons/dollar.png"),
                size: 15,
                color: Colors.white,
              ),
              Container(
                padding: const EdgeInsets.only(left: 8),
                width: 200,
                child: TextField(
                  controller: this.amountController,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    fontFamily: "SegoeUI",
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: subTextColor,
                  ),
                  onChanged: (value) {
                    this.list[this.index].totalAmount = value;
                  },
                  decoration: InputDecoration(
                      hintText: "Total Amount",
                      hintStyle: TextStyle(
                        fontFamily: "SegoeUI",
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: subTextColor,
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.all(6)
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}
