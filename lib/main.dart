import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oneshot/classes/Projects.dart';
import 'package:oneshot/newProject.dart';
import 'package:oneshot/settings.dart';

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

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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
        child: Scaffold(
          backgroundColor: Color(0xff1E1E1E),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.menu,
                            size: 25,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            print(MyHomePage.projectList.length);
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
                            Icons.settings,
                            size: 25,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.of(context).push(toSettings());
                          },
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: width,
                    height: 70,
                    padding: EdgeInsets.only(top: 28, left: 16, right: 16),
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
                  )
                ],
              ),
            ),
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
