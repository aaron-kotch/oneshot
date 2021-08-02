import 'dart:math';

import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oneshot/classes/BudgetDetails.dart';
import 'package:oneshot/classes/Projects.dart';
import 'package:oneshot/customWidgets/CustomExpansionTile.dart';
import 'package:oneshot/drawer.dart';
import 'package:oneshot/dropdownList.dart';
import 'package:oneshot/viewProject.dart';
import 'package:oneshot/pageRoutes.dart';
import 'package:oneshot/settings.dart';
import 'package:oneshot/templateMenu.dart';
import 'package:oneshot/test.dart';

import 'CustomExpansionPanel.dart';
import 'deleted.dart';
import 'newProject.dart';

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

  const MyHomePage({Key? key, this.isExpanded = false});

  static List<List<dynamic>> projectList = [];
  static final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  final bool isExpanded;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

  Color textColor = Color(0xffD5754A);
  Color orangeAccent = Color(0xffD5754A);
  Color baseColor = Color(0xff1E1E1E);

  bool expanded = false;

  late final AnimationController _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
      value: 1); // fade animation controller for body when expanding top menu.

  late final _slideController = AnimationController(
      duration: Duration(milliseconds: 250), vsync: this);

  late final Animation<double> _fadeAnim = CurvedAnimation(
      parent: _controller, curve: Curves.fastOutSlowIn);

  static final Animatable<Offset> _iconSlideTween = Tween(
    begin: Offset(0, -2), end: Offset.zero,)
      .chain(CurveTween(curve: Curves.fastOutSlowIn));

  late Animation<Offset> _iconSlides = _slideController.drive(_iconSlideTween);

  @override
  void dispose() {
    _controller.dispose();
    _slideController.dispose();
    super.dispose();
  }

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
                          print(expanded);

                          if (expanded) {
                            _controller.reverse();
                            _slideController.forward();
                          } else {
                            _controller.forward();
                            _slideController.reverse();
                          }
                        });
                      },
                      children: [
                        CustomExpansionPanel(
                            headerBuilder: (context, state) {
                              return Container(
                                  child: expanded
                                      ? SlideTransition(
                                    position: _iconSlides,
                                    child: Text(
                                      'Template Menu',
                                      style: TextStyle(
                                        fontFamily: 'Calibri',
                                        fontWeight: FontWeight.w300,
                                        fontSize: 24,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                      : FadeTransition(
                                    opacity: _fadeAnim,
                                    child: Text(
                                      'Budget Sheet',
                                      style: TextStyle(
                                        fontFamily: 'Calibri',
                                        fontWeight: FontWeight.w300,
                                        fontSize: 24,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                              );
                            },
                            body: Container(
                              child: DropdownList(),
                            ),
                            isExpanded: expanded,
                            canTapOnHeader: false,
                            backgroundColor: Color(0xff1E1E1E)
                        ),
                      ],
                    ), // Top bar of main page
                    FadeTransition(
                      opacity: _fadeAnim,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: width,
                            padding: EdgeInsets.only(top: 16,
                                left: 16,
                                right: 16,
                                bottom: 16),
                            child: TextField(
                              textAlignVertical: TextAlignVertical.center,
                              style: TextStyle(
                                  fontSize: 16
                              ),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(12),
                                  filled: true,
                                  fillColor: Colors.grey[600],
                                  prefixIcon: Icon(Icons.search_rounded,
                                      color: Colors.grey[500]),
                                  suffixIcon: Icon(
                                      Icons.mic, color: Colors.grey[500]),
                                  hintText: "Search",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[500],
                                      height: 1,
                                      fontSize: 16
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  )
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 4),
                            width: width,
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: MyHomePage.projectList.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(toViewProject(index));
                                    },
                                    child: Container(
                                      padding: EdgeInsets.only(top: 16,
                                          left: 20,
                                          right: 20,
                                          bottom: 16),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .start,
                                            mainAxisSize: MainAxisSize.max,
                                            children: <Widget>[
                                              CircleAvatar(
                                                backgroundColor: Colors.red[700],
                                                radius: 6,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 16),
                                                child: Text(
                                                  "${MyHomePage.projectList[index][0].projectName}", //TODO
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
                                              mainAxisAlignment: MainAxisAlignment
                                                  .start,
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                Icon(
                                                  Icons.event_rounded,
                                                  size: 12,
                                                  color: Colors.grey[400],
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 16),
                                                  child: Text(
                                                    MyHomePage.projectList[index][0].budgetDate,
                                                    style: TextStyle(
                                                        fontFamily: 'CenturyGothic',
                                                        fontSize: 16,
                                                        fontWeight: FontWeight
                                                            .w400,
                                                        color: Colors.white
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ), // Body of main page, wrapped in fade transition
                  ],
                ),
              ),
            ),
            drawer: Drawer(
              child: MyDrawer(),
            ),
            floatingActionButton: FadeTransition(
                opacity: _fadeAnim,
                child: OpenContainer(
                  closedElevation: 6,
                  closedShape: CircleBorder(),
                  closedColor: Color(0xffD4410D),
                  openColor: baseColor,
                  transitionDuration: Duration(milliseconds: 300),
                  closedBuilder: (context, action) {
                    return Container(
                      width: 56,
                      height: 56,
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.add,
                      ),
                    );
                  },
                  openBuilder: (context, action) => NewProject(),
                )
            )
        ),
      ),
    );
  }
}