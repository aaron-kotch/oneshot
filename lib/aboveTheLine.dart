import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oneshot/classes/Budget.dart';
import 'package:oneshot/pageRoutes.dart';
import 'package:oneshot/projectBottomSheet.dart';
import 'package:oneshot/subBudgetTile.dart';

class AboveTheLine extends StatefulWidget {

  const AboveTheLine({Key? key}) : super(key: key);

  static List<Budget> list = [
    new Budget(title: "Development Rights"),
    new Budget(title: "Story & Rights"),
    new Budget(title: "Director & Staff"),
    new Budget(title: "Cast"),
    new Budget(title: "Travel & Living"),
  ];

  @override
  _AboveTheLineState createState() => _AboveTheLineState();
}

class _AboveTheLineState extends State<AboveTheLine> {

  Color textColor = Color(0xffD2480A);
  Color subTextColor = Color(0xff999999);
  Color borderColor = Color(0xff0E0E0E);

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xff171717),
        systemNavigationBarIconBrightness: Brightness.light
    ));

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff1E1E1E),
        body: Container(
          width: width,
          height: height,
          child: Column(
            children: <Widget>[
              Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 28, left: 16, right: 16, bottom: 16),
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
              Expanded(
                child: ListView.builder(
                  itemCount: AboveTheLine.list.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return SubBudgetTile(
                      title: AboveTheLine.list[index].title,
                      payee: AboveTheLine.list[index].totalPayee == "0" ? "-" : AboveTheLine.list[index].totalPayee,
                      amount: AboveTheLine.list[index].totalAmount == "0" ? "-" : AboveTheLine.list[index].totalAmount,
                    );
                  }
                )
              ), // main listview
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
                              totalValue().toString(),
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
                        Navigator.of(context).push(toNewAboveTheLine(AboveTheLine.list));
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

  int totalValue() {
    int total = 0;
    for (var i in AboveTheLine.list) {
      total = total + int.parse(i.totalAmount);
    }
    return total;
  }

}
