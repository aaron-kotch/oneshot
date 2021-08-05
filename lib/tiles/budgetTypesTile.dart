import 'package:flutter/material.dart';

class BudgetTypesTile extends StatelessWidget {

  const BudgetTypesTile({Key? key, this.title, this.count, this.value, required this.onPressed}) : super(key: key);

  final title;
  final value;
  final count;
  final Function onPressed;

  final Color textColor = const Color(0xffD2480A);
  final Color subTextColor = const Color(0xff999999);
  final Color borderColor = const Color(0xff0E0E0E);

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      minVerticalPadding: 0,
      contentPadding: EdgeInsets.zero,
      onTap: () {
        this.onPressed();
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
                            this.title,
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
                        this.value,
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
                        this.count,
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