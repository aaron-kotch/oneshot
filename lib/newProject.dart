import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oneshot/aboveTheLine.dart';
import 'package:oneshot/budgetTypesTile.dart';
import 'package:oneshot/classes/Projects.dart';
import 'package:oneshot/main.dart';
import 'package:oneshot/pageRoutes.dart';
import 'package:oneshot/postProductionExpenses.dart';
import 'package:oneshot/productionExpenses.dart';
import 'package:oneshot/projectBottomSheet.dart';

import 'otherExpenses.dart';

class NewProject extends StatefulWidget {
  const NewProject({Key? key}) : super(key: key);

  @override
  _NewProjectState createState() => _NewProjectState();
}

class _NewProjectState extends State<NewProject> with SingleTickerProviderStateMixin {

  var _tabController;
  int _tabIndex = 0;

  TextEditingController _companyTC = new TextEditingController();
  TextEditingController _titleTC = new TextEditingController();
  TextEditingController _prepareTC = new TextEditingController();
  TextEditingController _dateTC = new TextEditingController();
  TextEditingController _daysTC = new TextEditingController();
  TextEditingController _producersTC = new TextEditingController();
  TextEditingController _unionTC = new TextEditingController();
  TextEditingController _locationTC = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _tabIndex = _tabController.index;
      });
    });
  }

  Map<String, int> budgetAmount = {'Above The Line': 0, 'Production': 0, 'Post Production': 0, 'Other': 0, 'Total': 0};

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    Color textColor = Color(0xffD2480A);
    Color subTextColor = Color(0xff999999);
    Color borderColor = Color(0xff0E0E0E);
    Color baseColor = Color(0xff1E1E1E);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xff171717),
        systemNavigationBarIconBrightness: Brightness.light
    ));

    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xff1E1E1E),
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: Container(
              alignment: Alignment.topCenter,
              width: width,
              height: height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                              'Project 1',
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
                  ), // top actions bar
                  Container(
                    child: TabBar(
                      controller: _tabController,
                      tabs: [
                        Tab(text: "Project"),
                        Tab(text: "Budget"),
                      ],
                      labelStyle: TextStyle(
                          fontFamily: 'SegoeUI',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Colors.white
                      ),
                      isScrollable: true,
                      indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(
                          color: Color(0xffDD410D),
                        ),
                        insets: EdgeInsets.symmetric(horizontal: 20),
                      ),
                    ),
                  ), // tab bar
                  Expanded(
                    child: TabBarView(
                        controller: _tabController,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
                            child: ListView(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(top: 8, bottom: 8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "Production Company",
                                        style: TextStyle(
                                          fontFamily: "Inter",
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: textColor,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(top: 4),
                                        height: 32,
                                        child: TextField(
                                          controller: _companyTC,
                                          style: TextStyle(
                                            fontFamily: "SegoeUI",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey[300],
                                          ),
                                          decoration: InputDecoration(
                                            hintText: "Tap to add company name",
                                            hintStyle: TextStyle(
                                              fontFamily: "SegoeUI",
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: subTextColor,
                                            ),
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ],
                                  ),
                                ), // company
                                Container(
                                  padding: EdgeInsets.only(top: 8, bottom: 8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "Project Title",
                                        style: TextStyle(
                                          fontFamily: "Inter",
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: textColor,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(top: 4),
                                        height: 32,
                                        child: TextField(
                                          controller: _titleTC,
                                          style: TextStyle(
                                            fontFamily: "SegoeUI",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey[300],
                                          ),
                                          decoration: InputDecoration(
                                            hintText: "Tap to add project title",
                                            hintStyle: TextStyle(
                                              fontFamily: "SegoeUI",
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: subTextColor,
                                            ),
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ],
                                  ),
                                ), // title
                                Container(
                                  padding: EdgeInsets.only(top: 8, bottom: 8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "Prepare By",
                                        style: TextStyle(
                                          fontFamily: "Inter",
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: textColor,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(top: 4),
                                        height: 32,
                                        child: TextField(
                                          controller: _prepareTC,
                                          style: TextStyle(
                                            fontFamily: "SegoeUI",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey[300],
                                          ),
                                          decoration: InputDecoration(
                                            hintText: "Tap to add the name",
                                            hintStyle: TextStyle(
                                              fontFamily: "SegoeUI",
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: subTextColor,
                                            ),
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ],
                                  ),
                                ), // prepare by
                                Container(
                                  padding: EdgeInsets.only(top: 8, bottom: 8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "Budget Dates",
                                        style: TextStyle(
                                          fontFamily: "Inter",
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: textColor,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(top: 4),
                                        height: 32,
                                        child: TextField(
                                          controller: _dateTC,
                                          style: TextStyle(
                                            fontFamily: "SegoeUI",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey[300],
                                          ),
                                          decoration: InputDecoration(
                                            hintText: "01/01/2017",
                                            hintStyle: TextStyle(
                                              fontFamily: "SegoeUI",
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: subTextColor,
                                            ),
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ],
                                  ),
                                ), // budget dates
                                Container(
                                  padding: EdgeInsets.only(top: 8, bottom: 8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "Shoot Days",
                                        style: TextStyle(
                                          fontFamily: "Inter",
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: textColor,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(top: 4),
                                        height: 32,
                                        child: TextField(
                                          controller: _daysTC,
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(
                                            fontFamily: "SegoeUI",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey[300],
                                          ),
                                          decoration: InputDecoration(
                                            hintText: "Tap to add the number of shoot days",
                                            hintStyle: TextStyle(
                                              fontFamily: "SegoeUI",
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: subTextColor,
                                            ),
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ],
                                  ),
                                ), // shoot days
                                Container(
                                  padding: EdgeInsets.only(top: 8, bottom: 8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "Producers",
                                        style: TextStyle(
                                          fontFamily: "Inter",
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: textColor,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(top: 4),
                                        height: 32,
                                        child: TextField(
                                          controller: _producersTC,
                                          style: TextStyle(
                                            fontFamily: "SegoeUI",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey[300],
                                          ),
                                          decoration: InputDecoration(
                                            hintText: "Tap to add producers name",
                                            hintStyle: TextStyle(
                                              fontFamily: "SegoeUI",
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: subTextColor,
                                            ),
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ],
                                  ),
                                ), // producers
                                Container(
                                  padding: EdgeInsets.only(top: 8, bottom: 8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "Union",
                                        style: TextStyle(
                                          fontFamily: "Inter",
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: textColor,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(top: 4),
                                        height: 32,
                                        child: TextField(
                                          controller: _unionTC,
                                          style: TextStyle(
                                            fontFamily: "SegoeUI",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey[300],
                                          ),
                                          decoration: InputDecoration(
                                            hintText: "Tap to choose yes or no",
                                            hintStyle: TextStyle(
                                              fontFamily: "SegoeUI",
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: subTextColor,
                                            ),
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ],
                                  ),
                                ), // union
                                Container(
                                  padding: EdgeInsets.only(top: 8, bottom: 8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "Location",
                                        style: TextStyle(
                                          fontFamily: "Inter",
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: textColor,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(top: 4),
                                        height: 32,
                                        child: TextField(
                                          controller: _locationTC,
                                          style: TextStyle(
                                            fontFamily: "SegoeUI",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey[300],
                                          ),
                                          decoration: InputDecoration(
                                            hintText: "Tap to add location name",
                                            hintStyle: TextStyle(
                                              fontFamily: "SegoeUI",
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: subTextColor,
                                            ),
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ],
                                  ),
                                ), // budget dates
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                  child: ListView(
                                    shrinkWrap: true,
                                    children: <Widget>[
                                      BudgetTypesTile(
                                        title: "Above The Line",
                                        value: "\$ ${budget()["Above The Line"]![0]}",
                                        count: "${budget()["Above The Line"]![1]}",
                                        onPressed: () {
                                          Navigator.of(context).push(toAboveTheLine()).then((value) {
                                            setState(() {

                                            });
                                          });
                                        },
                                      ),
                                      BudgetTypesTile(
                                        title: "Production",
                                        value: "\$ ${budget()["Production"]![0]}",
                                        count: "${budget()["Production"]![1]}",
                                        onPressed: () {
                                          Navigator.of(context).push(toProductionExpenses()).then((value) {
                                            setState(() {

                                            });
                                          });
                                        },
                                      ), //production
                                      BudgetTypesTile(
                                        title: "Post Production",
                                        value: "\$ ${budget()["Post Production"]![0]}",
                                        count: "${budget()["Post Production"]![1]}",
                                        onPressed: () {
                                          Navigator.of(context).push(toPostProductionExpenses()).then((value) {
                                            setState(() {

                                            });
                                          });
                                        },
                                      ), //post production
                                      BudgetTypesTile(
                                        title: "Other Expenses",
                                        value: "\$ ${budget()["Other"]![0]}",
                                        count: "${budget()["Other"]![1]}",
                                        onPressed: () {
                                          Navigator.of(context).push(toOtherExpenses()).then((value) {
                                            setState(() {

                                            });
                                          });
                                        },
                                      ), //other expenses
                                      ListTile(
                                        minVerticalPadding: 0,
                                        contentPadding: EdgeInsets.zero,
                                        title: Padding(
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
                                                              "Grand Total",
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
                                                          "\$ ${budget()["Total"]![0]}",
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
                                                          "${budget()["Total"]![1]}",
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
                                        onTap: () {

                                        },
                                      ), // total
                                    ],
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
                                            ),
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          //Navigator.of(context).push(toNewAboveTheLine());
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
                            ]
                          ),
                        ]
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }

  void saveProject() {
    Projects project = new Projects(_companyTC.text, _titleTC.text, _prepareTC.text, _dateTC.text, int.parse(_daysTC.text), _producersTC.text, _unionTC.text, _locationTC.text);

    setState(() {
      MyHomePage.projectList.add(project);
    });
  }

  Map<String, List<int>> budget() {
    Map<String, List<int>> budgetAmount = {'Above The Line': [0, 0], 'Production': [0, 0], 'Post Production': [0, 0], 'Other': [0, 0], 'Total': [0, 0]};

    int atlAmount = 0, atlPayee = 0;
    int pAmount = 0, pPayee = 0;
    int pPAmount = 0, pPPayee = 0;
    int oAmount = 0, oPayee = 0;
    int totalAmount = 0, totalPayee = 0;

    for (var i in AboveTheLine.list) {
      atlAmount = atlAmount + int.parse(i.totalAmount);
      atlPayee = atlPayee + int.parse(i.totalPayee);
    }

    for (var i in ProductionExpenses.productionBudgetList) {
      for (var x in i) {
        pAmount = pAmount + int.parse(x.totalAmount);
        pPayee = pPayee + int.parse(x.totalPayee);
      }
    }

    for (var i in PostProductionExpenses.postProductionList) {
      pPAmount = pPAmount + int.parse(i.totalAmount);
      pPPayee = pPPayee + int.parse(i.totalPayee);
    }

    for (var i in OtherExpenses.otherList) {
      oAmount = oAmount + int.parse(i.totalAmount);
      oPayee = oPayee + int.parse(i.totalPayee);
    }

    totalPayee = atlPayee + pPPayee + pPPayee + oPayee;
    totalAmount = atlAmount + pPAmount + pPAmount + oAmount;

    budgetAmount = {'Above The Line': [atlAmount, atlPayee], 'Production': [pAmount, pPayee], 'Post Production': [pPAmount, pPPayee], 'Other': [oAmount, oPayee], 'Total': [totalAmount, totalPayee]};

    return budgetAmount;
  }

}