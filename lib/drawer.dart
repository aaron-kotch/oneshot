import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {

  Color textColor = Color(0xffD5754A);
  Color orangeAccent = Color(0xffD5754A);
  Color baseColor = Color(0xff1E1E1E);

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: width,
          height: 140,
          padding: EdgeInsets.only(left: 16, bottom: 20),
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
              fontFamily: "CenturyGothic",
              fontWeight: FontWeight.w700,
              fontSize: 36,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          width: width,
          padding: EdgeInsets.only(top:20, left: 24, bottom: 24),
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
          contentPadding: EdgeInsets.only(left: 20),
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
          onTap: () {},
        ),
        Container(
          width: width,
          padding: EdgeInsets.only(top:20, left: 24, bottom: 24),
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
          contentPadding: EdgeInsets.only(left: 20),
          tileColor: baseColor,
          leading: Icon(
            Icons.cloud,
            size: 18,
            color: orangeAccent,
          ),
          title: Text(
            "iCloud Drive",
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
          contentPadding: EdgeInsets.only(left: 20),
          tileColor: baseColor,
          leading: Icon(
            Icons.cloud,
            size: 18,
            color: orangeAccent,
          ),
          title: Text(
            "iCloud Drive",
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: textColor,
            ),
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
