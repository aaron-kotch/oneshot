import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oneshot/classes/BudgetDetails.dart';
import 'package:oneshot/pageRoutes.dart';
import 'package:oneshot/projectBottomSheet.dart';
import 'package:oneshot/subBudgetTile.dart';

class AboveTheLine extends StatefulWidget {

  AboveTheLine({Key? key, required this.projectIndex}) : super(key: key);

  final projectIndex;

  List<BudgetDetails> list = [
    new BudgetDetails(title: "Development Rights"),
    new BudgetDetails(title: "Story & Rights"),
    new BudgetDetails(title: "Director & Staff"),
    new BudgetDetails(title: "Cast"),
    new BudgetDetails(title: "Travel & Living"),
  ];

  List<BudgetDetails> get itemList => itemList;

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

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
                  itemCount: widget.list.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return SubBudgetTile(
                      title: widget.list[index].title,
                      payee: widget.list[index].totalPayee == "0" ? "-" : widget.list[index].totalPayee,
                      amount: widget.list[index].totalAmount == "0" ? "-" : widget.list[index].totalAmount,
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
                        Navigator.of(context).push(toNewAboveTheLine(widget.list, widget.projectIndex));
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
    for (var i in widget.list) {
      total = total + int.parse(i.totalAmount);
    }
    return total;
  }

}
