import 'package:flutter/material.dart';

class BudgetTypesTile extends StatefulWidget {
  var title;
  var value;
  var count;
  Function onPressed;

  BudgetTypesTile({Key? key, this.title, this.count, this.value, required this.onPressed}) : super(key: key);

  @override
  _BudgetTypesTileState createState() => _BudgetTypesTileState();
}

class _BudgetTypesTileState extends State<BudgetTypesTile> {

  Color textColor = Color(0xffD2480A);
  Color subTextColor = Color(0xff999999);
  Color borderColor = Color(0xff0E0E0E);

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      minVerticalPadding: 0,
      contentPadding: EdgeInsets.zero,
      onTap: () {
        widget.onPressed();
      },
      title: Container(
        padding: const EdgeInsets.only(left: 32, right: 32),
        child: Container(
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(color: borderColor, width: 1)
              )
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Color(0xffDD410D),
                          radius: 5,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Text(
                            widget.title,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 4, left: 18),
                      child: Text(
                        widget.value,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.person,
                      size: 25,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4, right: 8),
                      child: Text(
                        widget.count,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
