import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xff1E1E1E),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 32, left: 32, right: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(
                        Icons.menu,
                        size: 25,
                        color: Colors.white,
                      ),
                      Container(
                        child: Text(
                          'Projects',
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
                  )
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0xffD4410D),
            onPressed:() {
              add();
            },
            tooltip: 'Increment',
            child: Icon(Icons.add, color: Colors.black,
            ),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        )
    );
  }

  int add() {

    return 0;

  }
}

Route toSettings() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Settings(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1, 0);
        var end = Offset.zero;
        var curve = Curves.easeOut;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      }
  );
}
