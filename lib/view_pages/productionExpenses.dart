import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:oneshot/pageRoutes.dart';
import 'package:oneshot/custom_widgets/projectBottomSheet.dart';
import 'package:oneshot/tiles/subBudgetTile.dart';

import '../classes/BudgetDetails.dart';

class ProductionExpenses extends StatefulWidget {
  ProductionExpenses({Key? key, required this.projectIndex}) : super(key: key);

  final int projectIndex;

  final List<List<BudgetDetails>> productionBudgetList = [
    [
      new BudgetDetails(title: "Production Staff"),
      new BudgetDetails(title: "Extra Talent"),
      new BudgetDetails(title: "Set Construction"),
      new BudgetDetails(title: "Set Design"),
      new BudgetDetails(title: "Set Pre-Rig & Strike"),
      new BudgetDetails(title: "Set Operations"),
      new BudgetDetails(title: "Set Dressing"),
    ],
    [
      new BudgetDetails(title: "Property"),
      new BudgetDetails(title: "Wardrobe"),
      new BudgetDetails(title: "Electric"),
      new BudgetDetails(title: "Camera"),
      new BudgetDetails(title: "Production Sound"),
      new BudgetDetails(title: "Make-up & hair"),
      new BudgetDetails(title: "Transportation"),
    ],
    [
      new BudgetDetails(title: "Locations"),
      new BudgetDetails(title: "Picture Vehicles & Animals"),
      new BudgetDetails(title: "Special Effects"),
      new BudgetDetails(title: "Visual Effects - Post"),
      new BudgetDetails(title: "Film & Lab"),
      new BudgetDetails(title: "BTL Travel"),
    ]
  ];

  @override
  _ProductionExpensesState createState() => _ProductionExpensesState();
}

class _ProductionExpensesState extends State<ProductionExpenses> {

  final PageController _pageController = new PageController(initialPage: 0);
  double pageIndex = 0.0;

  final Color textColor = const Color(0xffD2480A);
  final Color subTextColor = const Color(0xff999999);
  final Color borderColor = const Color(0xff0E0E0E);

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        pageIndex = _pageController.page!;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    List<Widget> indicatorWidget = [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Hero(
              tag: "index",
              child: CircleAvatar(
                radius: 2.5,
                backgroundColor: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: CircleAvatar(
              radius: 2.5,
              backgroundColor: Colors.grey[600],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: CircleAvatar(
              radius: 2.5,
              backgroundColor: Colors.grey[600],
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: CircleAvatar(
              radius: 2.5,
              backgroundColor: Colors.grey[600],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Hero(
              tag: "index",
              child: CircleAvatar(
                radius: 2.5,
                backgroundColor: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: CircleAvatar(
              radius: 2.5,
              backgroundColor: Colors.grey[600],
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: CircleAvatar(
              radius: 2.5,
              backgroundColor: Colors.grey[600],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: CircleAvatar(
              radius: 2.5,
              backgroundColor: Colors.grey[600],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Hero(
              tag: "index",
              child: CircleAvatar(
                radius: 2.5,
                backgroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff1E1E1E),
        body: Container(
          height: height,
          width: width,
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
                        icon: const Icon(
                          Icons.arrow_back_ios_rounded,
                          size: 20,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Container(
                        child: const Text(
                          'Production Expenses',
                          style: TextStyle(
                            fontFamily: 'Calibri',
                            fontWeight: FontWeight.w300,
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
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
                child: Stack(
                  children: <Widget>[
                    PageView(
                      controller: _pageController,
                      children: <Widget>[
                        Container(
                          child: ListView.builder(
                            padding: EdgeInsets.only(bottom: 60),
                            itemCount: widget.productionBudgetList[0].length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return SubBudgetTile(
                                title: widget.productionBudgetList[0][index].title,
                                payee: widget.productionBudgetList[0][index].totalPayee == "0" ? "-" : widget.productionBudgetList[0][index].totalPayee,
                                amount: widget.productionBudgetList[0][index].totalAmount == "0" ? "-" : widget.productionBudgetList[0][index].totalAmount,
                              );
                            },
                          ),
                        ),
                        Container(
                          child: ListView.builder(
                            padding: EdgeInsets.only(bottom: 60),
                            itemCount: widget.productionBudgetList[1].length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return SubBudgetTile(
                                title: widget.productionBudgetList[1][index].title,
                                payee: widget.productionBudgetList[1][index].totalPayee == "0" ? "-" : widget.productionBudgetList[1][index].totalPayee,
                                amount: widget.productionBudgetList[1][index].totalAmount == "0" ? "-" : widget.productionBudgetList[1][index].totalAmount,
                              );
                            },
                          ),
                        ),
                        Stack(
                          children: [
                            ListView.builder(
                              padding: EdgeInsets.only(bottom: 100),
                              itemCount: widget.productionBudgetList[2].length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return SubBudgetTile(
                                  title: widget.productionBudgetList[2][index].title,
                                  payee: widget.productionBudgetList[2][index].totalPayee == "0" ? "-" : widget.productionBudgetList[2][index].totalPayee,
                                  amount: widget.productionBudgetList[2][index].totalAmount == "0" ? "-" : widget.productionBudgetList[2][index].totalAmount,
                                );
                              },
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 72,
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(top: 20),
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
                                          Navigator.of(context).push(toNewProductionExpenses(widget.productionBudgetList, widget.projectIndex));
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
                            ),
                          ],
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: width,
                        height: 30,
                        child: indicatorWidget[pageIndex.round()],
                      )
                    ),
                  ],
                )
              ), // main listview
            ],
          ),
        ),
      )
    );
  }

  int totalValue() {
    int total = 0;
    for (var i in widget.productionBudgetList) {
      for (var x in i) {
        total = total +  int.parse(x.totalAmount);
      }
    }
    return total;
  }

}
