import 'package:flutter/material.dart';

class DropdownList extends StatefulWidget {
  const DropdownList({Key? key}) : super(key: key);

  @override
  _DropdownListState createState() => _DropdownListState();
}

class _DropdownListState extends State<DropdownList> {

  Color textColor = Color(0xffD5754A);
  Color orangeAccent = Color(0xffD5754A);
  Color baseColor = Color(0xff1E1E1E);

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.only(left: 28, top: 10, bottom: 10),
          minVerticalPadding: 0,
          leading: Ink(
            width: 80,
            height: 80,
            decoration: ShapeDecoration(
              color: orangeAccent,
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: ImageIcon(
                AssetImage("assets/icons/telegram.png"),
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
          title: Text(
            "Call Sheet",
            style: TextStyle(
              fontFamily: 'Calibri',
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: orangeAccent,
            ),
          ),
          onTap: () {},
        ),
        ListTile(
          contentPadding: EdgeInsets.only(left: 28, top: 10, bottom: 10),
          minVerticalPadding: 0,
          leading: Ink(
            width: 80,
            height: 80,
            decoration: ShapeDecoration(
              color: orangeAccent,
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: ImageIcon(
                AssetImage("assets/icons/clapperboard.png"),
                color: Colors.white,
              ),
              onPressed: () {

              },
            ),
          ),
          title: Text(
            "Shot List",
            style: TextStyle(
              fontFamily: 'Calibri',
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: orangeAccent,
            ),
          ),
          onTap: () {},
        ),
        ListTile(
          contentPadding: EdgeInsets.only(left: 28, top: 10, bottom: 10),
          minVerticalPadding: 0,
          leading: Ink(
            width: 80,
            height: 80,
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
          title: Text(
            "Budget Sheet",
            style: TextStyle(
              fontFamily: 'Calibri',
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: orangeAccent,
            ),
          ),
        ),
        ListTile(
          contentPadding: EdgeInsets.only(left: 28, top: 10, bottom: 10),
          minVerticalPadding: 0,
          leading: Ink(
            width: 80,
            height: 80,
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
          title: Text(
            "One Liner",
            style: TextStyle(
              fontFamily: 'Calibri',
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: orangeAccent,
            ),
          ),
        ),
        ListTile(
          contentPadding: EdgeInsets.only(left: 28, top: 10, bottom: 10),
          minVerticalPadding: 0,
          leading: Ink(
            width: 80,
            height: 80,
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
          title: Text(
            "Storyboard",
            style: TextStyle(
              fontFamily: 'Calibri',
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: orangeAccent,
            ),
          ),
        ),
        ListTile(
          contentPadding: EdgeInsets.only(left: 28, top: 10, bottom: 10),
          minVerticalPadding: 0,
          leading: Ink(
            width: 80,
            height: 80,
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
          title: Text(
            "Concept Board",
            style: TextStyle(
              fontFamily: 'Calibri',
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: orangeAccent,
            ),
          ),
        ),
      ],
    );
  }
}
