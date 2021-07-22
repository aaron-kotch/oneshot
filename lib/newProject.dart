import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oneshot/aboveTheLine.dart';
import 'package:oneshot/classes/Projects.dart';
import 'package:oneshot/main.dart';
import 'package:oneshot/productionExpenses.dart';
import 'package:oneshot/projectBottomSheet.dart';

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
                          SingleChildScrollView(
                            child: Container(
                              padding: EdgeInsets.only(top: 24, bottom: 24, left: 24, right: 24),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                  child: ListView(
                                    shrinkWrap: true,
                                    children: <Widget>[
                                      ListTile(
                                        contentPadding: EdgeInsets.zero,
                                        title: Container(
                                          padding: const EdgeInsets.only(top: 24, bottom: 24, left: 32, right: 32),
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
                                                          "Above The Line",
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
                                                      "\$ 15,000",
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
                                                      "10",
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
                                        onTap: () {
                                          Navigator.of(context).push(toAboveTheLine());
                                        },
                                      ), // above the line
                                      ListTile(
                                        minVerticalPadding: 0,
                                        contentPadding: EdgeInsets.zero,
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
                                                              "Production",
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
                                                          "\$ 60,000",
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
                                                          "20",
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
                                          Navigator.of(context).push(toProductionExpenses());
                                        },
                                      ), // post production
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
                                                              "Post Production",
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
                                                          "\$ 15,000",
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
                                                          "10",
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
                                      ), // post production
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
                                                              "Other Expenses",
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
                                                          "\$ 12,000",
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
                                                          "8",
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
                                      ), // other expenses
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
                                      ), // other e
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
                                            )
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.add_circle,
                                      color: textColor,
                                      size: 30,
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

Route toAboveTheLine() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => AboveTheLine(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(1, 0);
      var end = Offset.zero;
      var curve = Curves.easeInOut;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var secondTween = Tween(begin: end, end: begin).chain(CurveTween(curve: Curves.easeOut));

      return SlideTransition(
        position: tween.animate(animation),
        child: child,
      );
    }
  );
}

Route toProductionExpenses() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => ProductionExpenses(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1, 0);
        var end = Offset.zero;
        var curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var secondTween = Tween(begin: end, end: begin).chain(CurveTween(curve: Curves.easeOut));

        return SlideTransition(
          position: tween.animate(animation),
          child: child,
        );
      }
  );
}

Route toMain() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => MyHomePage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0, -1);
        var end = Offset.zero;
        var curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      }
  );
}
