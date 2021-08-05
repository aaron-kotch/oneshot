import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oneshot/classes/BudgetDetails.dart';
import 'package:oneshot/pageRoutes.dart';
import 'package:oneshot/custom_widgets/projectBottomSheet.dart';
import 'package:oneshot/tiles/subBudgetTile.dart';

class OtherExpenses extends StatefulWidget {
  OtherExpenses({Key? key, required this.projectIndex}) : super(key: key);

  final int projectIndex;

  final List<BudgetDetails> otherList = [
    BudgetDetails(title: "Publicity"),
    BudgetDetails(title: "Legal & Accounting"),
    BudgetDetails(title: "General Expenses"),
    BudgetDetails(title: "Insurance"),
  ];

  @override
  _OtherExpensesState createState() => _OtherExpensesState();
}

class _OtherExpensesState extends State<OtherExpenses> {

  final Color textColor = const Color(0xffD2480A);
  final Color subTextColor = const Color(0xff999999);
  final Color borderColor = const Color(0xff0E0E0E);

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
                          'Other Expenses',
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
                child: Container(
                  padding: EdgeInsets.only(top: 32),
                  child: ListView.builder(
                    itemCount: widget.otherList.length,
                    itemBuilder: (context, index) {
                      return SubBudgetTile(
                        title: widget.otherList[index].title,
                        payee: widget.otherList[index].totalPayee == "0" ? "-" : widget.otherList[index].totalPayee,
                        amount: widget.otherList[index].totalAmount == "0" ? "-" : widget.otherList[index].totalAmount,
                      );
                    }
                  ),
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
                          Navigator.of(context).push(toNewOtherExpenses(widget.otherList, widget.projectIndex)).then((value) {
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
