import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oneshot/projectBottomSheet.dart';

class AboveTheLine extends StatefulWidget {
  const AboveTheLine({Key? key}) : super(key: key);

  @override
  _AboveTheLineState createState() => _AboveTheLineState();
}

class _AboveTheLineState extends State<AboveTheLine> {

  Color textColor = Color(0xffD2480A);
  Color subTextColor = Color(0xff999999);
  Color borderColor = Color(0xff0E0E0E);

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xff171717),
        systemNavigationBarIconBrightness: Brightness.light
    ));

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff1E1E1E),
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 28, left: 16, right: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_rounded,
                          size: 20,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Container(
                        child: Text(
                          'Above The Line',
                          style: TextStyle(
                            fontFamily: 'Calibri',
                            fontWeight: FontWeight.w300,
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.keyboard_control_rounded,
                          size: 20,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                              backgroundColor: Color(0xff131212),
                              context: context,
                              builder: (context) {
                                return ProjectBottomSheet();
                              });
                        },
                      )
                    ],
                  ),
                ),
              ), // top
              Container(
                padding: const EdgeInsets.only(top: 58),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: [
                              Text(
                                "Development Rights",
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
                    ), //development rights
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: [
                              Text(
                                "Story & Rights",
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
                    ), //story & rights
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: [
                              Text(
                                "Director & Staff",
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
                    ), //director & staff
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: [
                              Text(
                                "Cast",
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
                    ), //cast
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: [
                              Text(
                                "Travel & Living",
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
                    ), //travel & living
                  ],
                ),
              ), // main listview
              Spacer(),
              Container(
                height: 72,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 76),
                color: Color(0xff171717),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.search,
                      size: 25,
                      color: Colors.white,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ImageIcon(
                          AssetImage("assets/icons/dollar.png"),
                          size: 15,
                          color: Colors.white,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Text(
                              "Total Amount",
                              style: TextStyle(
                                fontFamily: 'SegoeUI',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color(0xff999999),
                              ),
                            )
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {

                      },
                      icon: Icon(
                        Icons.add_circle,
                        color: textColor,
                        size: 30,
                      )
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
