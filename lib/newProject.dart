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
                              'Budget Sheet',
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
                                      OpenContainer(
                                        closedBuilder: (context, action) {
                                          return BudgetTypesTile(
                                            title: "Above The Line",
                                            value: "\$15,000",
                                            count: "10",
                                          );
                                        },
                                        openBuilder: (context, action) => AboveTheLine(),
                                        closedElevation: 0,
                                        openElevation: 0,
                                        closedShape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero
                                        ),
                                        closedColor: baseColor,
                                        openColor: baseColor,
                                        transitionDuration: Duration(milliseconds: 300),
                                        onClosed: (val) {
                                          setState(() {

                                          });
                                        },
                                      ),
                                      BudgetTypesTile(
                                        title: "Production",
                                        value: "\$60,000",
                                        count: "20",
                                      ), //production
                                      BudgetTypesTile(
                                        title: "Post Production",
                                        value: "\$15,000",
                                        count: "10",
                                      ), //post production
                                      BudgetTypesTile(
                                        title: "Other Expenses",
                                        value: "\$12,000",
                                        count: "8",
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
                                                          "\$ 102,000",
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
                                                          "48",
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
                                            child: Hero(
                                              tag: "SubBudgetTitle",
                                              child: Text(
                                                "Total Amount",
                                                style: TextStyle(
                                                  fontFamily: 'SegoeUI',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                  color: Color(0xff999999),
                                                ),
                                              ),
                                            )
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.of(context).push(toNewAboveTheLine());
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
}