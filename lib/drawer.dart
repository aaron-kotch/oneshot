import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oneshot/main.dart';

import 'deleted.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {

  Color textColor = Color(0xffD5754A);
  Color orangeAccent = Color(0xffD5754A);
  Color baseColor = Color(0xff1E1E1E);

  bool icloudSwitch = false;
  bool darkModeSwitch = true;
  bool faceIdSwitch = true;

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: width,
          height: 140,
          padding: EdgeInsets.only(left: 28, bottom: 12),
          alignment: Alignment.bottomLeft,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/gradient.png"),
                fit: BoxFit.cover
            ),
          ),
          child: Text(
            "ONE SHOT",
            style: TextStyle(
              fontFamily: "Calibri",
              fontWeight: FontWeight.w700,
              fontSize: 36,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          width: width,
          padding: EdgeInsets.only(top:28, left: 28, bottom: 20),
          color: baseColor,
          child: Text(
            "Files",
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: textColor,
            ),
          ),
        ),
        ListTile(
          horizontalTitleGap: 4,
          visualDensity: VisualDensity(vertical: -1, horizontal: 0),
          contentPadding: EdgeInsets.only(left: 28),
          tileColor: baseColor,
          leading: Icon(
            Icons.delete,
            size: 18,
            color: orangeAccent,
          ),
          title: Text(
            "Recently Deleted",
            style: TextStyle(
              fontFamily: 'Calibri',
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: orangeAccent,
            ),
          ),
          onTap: () {
            Navigator.of(context).push(toDeleted());
            MyHomePage.scaffoldKey.currentState!.openEndDrawer();
          },
        ),
        Container(
          width: width,
          padding: EdgeInsets.only(top:20, left: 28, bottom: 20),
          color: baseColor,
          child: Text(
            "Storage / Backup",
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: textColor,
            ),
          ),
        ),
        ListTile(
          horizontalTitleGap: 4,
          visualDensity: VisualDensity(vertical: -1, horizontal: 0),
          contentPadding: EdgeInsets.only(left: 28),
          tileColor: baseColor,
          leading: Icon(
            Icons.cloud,
            size: 18,
            color: orangeAccent,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                "iCloud Drive",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: textColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 32),
                child: Transform.scale(
                  scale: 0.6,
                  child: CupertinoSwitch(
                    activeColor: orangeAccent,
                      value: icloudSwitch,
                      onChanged: (value) {
                        setState(() {
                          icloudSwitch = !icloudSwitch;
                        });
                      }),
                ),
              )
            ],
          ),
          onTap: () {},
        ),
        ListTile(
          horizontalTitleGap: 4,
          visualDensity: VisualDensity(vertical: -1, horizontal: 0),
          contentPadding: EdgeInsets.only(left: 28),
          tileColor: baseColor,
          leading: ImageIcon(
            AssetImage("assets/icons/google_drive.png"),
            size: 18,
            color: orangeAccent,
          ),
          title: Text(
            "Google Drive",
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: textColor,
            ),
          ),
          onTap: () {},
        ),
        ListTile(
          horizontalTitleGap: 4,
          visualDensity: VisualDensity(vertical: -1, horizontal: 0),
          contentPadding: EdgeInsets.only(left: 28),
          tileColor: baseColor,
          leading: ImageIcon(
            AssetImage("assets/icons/onedrive.png"),
            size: 18,
            color: orangeAccent,
          ),
          title: Text(
            "One Drive",
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: textColor,
            ),
          ),
          onTap: () {},
        ),
        Container(
          width: width,
          padding: EdgeInsets.only(top:20, left: 28, bottom: 20),
          color: baseColor,
          child: Text(
            "Settings",
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: textColor,
            ),
          ),
        ),
        ListTile(
          horizontalTitleGap: 4,
          visualDensity: VisualDensity(vertical: -1, horizontal: 0),
          contentPadding: EdgeInsets.only(left: 28),
          tileColor: baseColor,
          leading: Icon(
            Icons.language,
            size: 18,
            color: orangeAccent,
          ),
          title: Text(
            "Language",
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: textColor,
            ),
          ),
          onTap: () {},
        ),
        ListTile(
          horizontalTitleGap: 4,
          visualDensity: VisualDensity(vertical: -1, horizontal: 0),
          contentPadding: EdgeInsets.only(left: 28),
          tileColor: baseColor,
          leading: ImageIcon(
            AssetImage("assets/icons/moon.png"),
            size: 18,
            color: orangeAccent,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                "Dark Mode",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: textColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 32),
                child: Transform.scale(
                  scale: 0.6,
                  child: CupertinoSwitch(
                      activeColor: orangeAccent,
                      value: darkModeSwitch,
                      onChanged: (value) {
                        setState(() {
                          darkModeSwitch = !darkModeSwitch;
                        });
                      }),
                ),
              )
            ],
          ),
          onTap: () {},
        ),
        ListTile(
          horizontalTitleGap: 4,
          visualDensity: VisualDensity(vertical: -1, horizontal: 0),
          contentPadding: EdgeInsets.only(left: 28),
          tileColor: baseColor,
          leading: ImageIcon(
            AssetImage("assets/icons/face_id.png"),
            size: 18,
            color: orangeAccent,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                "Face ID",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: textColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 32),
                child: Transform.scale(
                  scale: 0.6,
                  child: CupertinoSwitch(
                      activeColor: orangeAccent,
                      value: faceIdSwitch,
                      onChanged: (value) {
                        setState(() {
                          faceIdSwitch = !faceIdSwitch;
                        });
                      }),
                ),
              )
            ],
          ),
          onTap: () {},
        ),
        Expanded(
          child: Container(
            color: baseColor,
          ),
        )
      ],
    );
  }
}

Route toDeleted() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Deleted(),
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