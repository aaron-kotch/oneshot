import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oneshot/classes/Projects.dart';
import 'package:oneshot/customWidgets/CustomExpansionTile.dart';
import 'package:oneshot/drawer.dart';
import 'package:oneshot/newProject.dart';
import 'package:oneshot/settings.dart';
import 'package:oneshot/templateMenu.dart';
import 'package:oneshot/test.dart';

import 'CustomExpansionPanel.dart';
import 'deleted.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    //sets status bar and nav bar color
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xff1E1E1E),
        statusBarColor: Color(0xff1E1E1E),
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light
    ));

    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  static List<Projects> projectList = [];
  static final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Color textColor = Color(0xffD5754A);
  Color orangeAccent = Color(0xffD5754A);
  Color baseColor = Color(0xff1E1E1E);

  bool expanded = false;

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xff1E1E1E),
        statusBarColor: Color(0xff1E1E1E),
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light
    ));

    var width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: new GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus!.unfocus();
          },
          child: Scaffold(
            key: MyHomePage.scaffoldKey,
            backgroundColor: Color(0xff1E1E1E),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    CustomExpansionPanelList(
                      expandedHeaderPadding: EdgeInsets.all(0),
                      animationDuration: Duration(milliseconds: 300),
                      expansionCallback: (index, isExpanded) {
                        setState(() {
                          expanded = !isExpanded;
                        });
                      },
                      children: [
                        CustomExpansionPanel(
                            headerBuilder: (context, state) {
                              return Container(
                                child: Text(
                                  'Budget Sheet',
                                  style: TextStyle(
                                    fontFamily: 'Calibri',
                                    fontWeight: FontWeight.w300,
                                    fontSize: 24,
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            },
                            body: Container(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          flex: 1,
                                          child: Container(
                                              width: width / 3,
                                              child: Column(
                                                children: [
                                                  ClipOval(
                                                      child: Container(
                                                        color: orangeAccent,
                                                        child: IconButton(
                                                          disabledColor: orangeAccent,
                                                          icon: ImageIcon(
                                                            AssetImage("assets/icons/telegram.png"),
                                                            color: Colors.white,
                                                          ),
                                                          onPressed: () {
                                                          },
                                                        ),
                                                      )
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 8),
                                                    child: Text(
                                                      "Call Sheet",
                                                      style: TextStyle(
                                                        fontFamily: 'Calibri',
                                                        fontWeight: FontWeight.w300,
                                                        fontSize: 13,
                                                        color: orangeAccent,
                                                      ),
                                                      maxLines: 2,
                                                    ),
                                                  )
                                                ],
                                              )
                                          ),
                                        ),
                                        Flexible(
                                          flex: 1,
                                          child: Container(
                                              width: width / 3,
                                              child: Column(
                                                children: [
                                                  ClipOval(
                                                    child: Container(
                                                      color: orangeAccent,
                                                      child: IconButton(
                                                        icon: ImageIcon(
                                                          AssetImage("assets/icons/clapperboard.png"),
                                                          color: Colors.white,
                                                        ),
                                                        onPressed: () {

                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 8),
                                                    child: Text(
                                                      "Shot List",
                                                      style: TextStyle(
                                                        fontFamily: 'Calibri',
                                                        fontWeight: FontWeight.w300,
                                                        fontSize: 13,
                                                        color: orangeAccent,
                                                      ),
                                                      maxLines: 2,
                                                    ),
                                                  )
                                                ],
                                              )
                                          ),
                                        ),
                                        Flexible(
                                          flex: 1,
                                          child: Container(
                                              width: width / 3,
                                              child: Column(
                                                children: [
                                                  Ink(
                                                    decoration: ShapeDecoration(
                                                      color: orangeAccent,
                                                      shape: CircleBorder(),
                                                    ),
                                                    child: IconButton(
                                                      icon: ImageIcon(
                                                        AssetImage("assets/icons/spreadsheet.png"),
                                                        color: Colors.white,
                                                      ),
                                                      onPressed: () {

                                                      },
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 8),
                                                    child: Text(
                                                      "Budget Sheet",
                                                      style: TextStyle(
                                                        fontFamily: 'Calibri',
                                                        fontWeight: FontWeight.w300,
                                                        fontSize: 13,
                                                        color: orangeAccent,
                                                      ),
                                                      maxLines: 2,
                                                    ),
                                                  )
                                                ],
                                              )
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          flex: 1,
                                          child: Container(
                                              width: width / 3,
                                              child: Column(
                                                children: [
                                                  Ink(
                                                    decoration: ShapeDecoration(
                                                      color: orangeAccent,
                                                      shape: CircleBorder(),
                                                    ),
                                                    child: IconButton(
                                                      icon: ImageIcon(
                                                        AssetImage("assets/icons/compose.png"),
                                                        color: Colors.white,
                                                      ),
                                                      onPressed: () {

                                                      },
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 8),
                                                    child: Text(
                                                      "One Liner",
                                                      style: TextStyle(
                                                        fontFamily: 'Calibri',
                                                        fontWeight: FontWeight.w300,
                                                        fontSize: 13,
                                                        color: orangeAccent,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              )
                                          ),
                                        ),
                                        Flexible(
                                          flex: 1,
                                          child: Container(
                                              width: width / 3,
                                              child: Column(
                                                children: [
                                                  Ink(
                                                    decoration: ShapeDecoration(
                                                      color: orangeAccent,
                                                      shape: CircleBorder(),
                                                    ),
                                                    child: IconButton(
                                                      icon: ImageIcon(
                                                        AssetImage("assets/icons/folder.png"),
                                                        color: Colors.white,
                                                      ),
                                                      onPressed: () {

                                                      },
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 8),
                                                    child: Text(
                                                      "Storyboard",
                                                      style: TextStyle(
                                                        fontFamily: 'Calibri',
                                                        fontWeight: FontWeight.w300,
                                                        fontSize: 13,
                                                        color: orangeAccent,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              )
                                          ),
                                        ),
                                        Flexible(
                                          flex: 1,
                                          child: Container(
                                              width: width / 3,
                                              child: Column(
                                                children: [
                                                  Ink(
                                                    decoration: ShapeDecoration(
                                                      color: orangeAccent,
                                                      shape: CircleBorder(),
                                                    ),
                                                    child: IconButton(
                                                      icon: ImageIcon(
                                                        AssetImage("assets/icons/flipboard.png"),
                                                        color: Colors.white,
                                                      ),
                                                      onPressed: () {

                                                      },
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 8),
                                                    child: Text(
                                                      "Concept Board",
                                                      style: TextStyle(
                                                        fontFamily: 'Calibri',
                                                        fontWeight: FontWeight.w300,
                                                        fontSize: 13,
                                                        color: orangeAccent,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              )
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            isExpanded: expanded,
                            canTapOnHeader: false,
                            backgroundColor: Color(0xff1E1E1E)
                        ),
                      ],
                    ),
                    Container(
                      width: width,
                      padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 16),
                      child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        style: TextStyle(
                            fontSize: 16
                        ),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(12),
                            filled: true,
                            fillColor: Colors.grey[600],
                            prefixIcon: Icon(Icons.search_rounded, color: Colors.grey[500]),
                            suffixIcon: Icon(Icons.mic, color: Colors.grey[500]),
                            hintText: "Search",
                            hintStyle: TextStyle(
                                color: Colors.grey[500],
                                height: 1,
                                fontSize: 16
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:  BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:  BorderRadius.circular(12),
                            )
                        ),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.red[700],
                                radius: 6,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Text(
                                  "Project 1",
                                  style: TextStyle(
                                      fontFamily: 'CenturyGothic',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Icon(
                                  Icons.event_rounded,
                                  size: 12,
                                  color: Colors.grey[400],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 16),
                                  child: Text(
                                    "01/01/2021",
                                    style: TextStyle(
                                        fontFamily: 'CenturyGothic',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 16),
                      width: width,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: MyHomePage.projectList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.only(top: 16, left: 20, right: 20, bottom: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      CircleAvatar(
                                        backgroundColor: Colors.red[700],
                                        radius: 6,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 16),
                                        child: Text(
                                          "Project ${index + 1}",
                                          style: TextStyle(
                                              fontFamily: 'CenturyGothic',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Icon(
                                          Icons.event_rounded,
                                          size: 12,
                                          color: Colors.grey[400],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 16),
                                          child: Text(
                                            MyHomePage.projectList[index].budgetDate,
                                            style: TextStyle(
                                                fontFamily: 'CenturyGothic',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
            drawer: Drawer(
              child: MyDrawer(),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Color(0xffD4410D),
              onPressed:() {
                Navigator.of(context).push(createProject()).then((value) {
                  setState(() {});
                });
              },
              tooltip: 'Increment',
              child: Icon(Icons.add, color: Colors.black,
              ),
            ), // This trailing comma makes auto-formatting nicer for build methods.
          ),
        ),
    );
  }

  int add() {

    return 0;

  }

  void setProject() {

    Projects projects = new Projects("epoi", "narden", "monday", "10/9/2020", 3, "Maxwell", "yes", "Miri");

    print(projects.company);

    setState(() {
      //projectList.add(projects);
    });

  }

}

Route toSettings() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Settings(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(1, 0);
      var end = Offset.zero;
      var curve = Curves.easeInOut;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var secondTween = Tween(begin: end, end: begin).chain(CurveTween(curve: Curves.easeOut));

      return SlideTransition(
        position: tween.animate(animation),
        child: SlideTransition(
          position: secondTween.animate(secondaryAnimation),
          child: child,
        ),
      );
    }
  );
}

Route createProject() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => NewProject(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0, 1);
        var end = Offset.zero;
        var curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var secondTween = Tween(begin: end, end:begin).chain(CurveTween(curve: Curves.easeInCubic));

        return SlideTransition(
          position: tween.animate(animation),
          child: child,
        );
      }
  );
}