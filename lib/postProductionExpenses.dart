import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oneshot/newSubBudgetTile.dart';
import 'package:oneshot/pageRoutes.dart';
import 'package:oneshot/projectBottomSheet.dart';
import 'package:oneshot/subBudgetTile.dart';

import 'classes/BudgetDetails.dart';

class PostProductionExpenses extends StatefulWidget {
  PostProductionExpenses({Key? key, required this.projectIndex}) : super(key: key);

  final int projectIndex;

  List<BudgetDetails> postProductionList = [
    BudgetDetails(title: "Film Editing"),
    BudgetDetails(title: "Music"),
    BudgetDetails(title: "Visual Effects"),
    BudgetDetails(title: "Post Production Sounds"),
    BudgetDetails(title: "Post Production Film & Lab"),
  ];

  List<BudgetDetails> get itemList => postProductionList;

  @override
  _PostProductionExpensesState createState() => _PostProductionExpensesState();
}

class _PostProductionExpensesState extends State<PostProductionExpenses> {

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
                          'Post Production Expenses',
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
                                return ProjectBottomSheet(index: widget.projectIndex);
                              });
                        },
                      )
                    ],
                  ),
                ),
              ), // top
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  itemCount: widget.postProductionList.length,
                  itemBuilder: (context, index) {
                    return SubBudgetTile(
                      title: widget.postProductionList[index].title,
                      payee: widget.postProductionList[index].totalPayee == "0" ? "-" : widget.postProductionList[index].totalPayee,
                      amount: widget.postProductionList[index].totalAmount == "0" ? "-" : widget.postProductionList[index].totalAmount,
                    );
                  }
                ),
              ),
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
                          Navigator.of(context).push(toNewPostProductionExpenses(widget.postProductionList, widget.projectIndex)).then((value) {
                            setState(() {

                            });
                          });
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
