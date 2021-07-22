import 'package:flutter/material.dart';

class ProjectBottomSheet extends StatefulWidget {
  const ProjectBottomSheet({Key? key}) : super(key: key);

  @override
  _ProjectBottomSheetState createState() => _ProjectBottomSheetState();
}

class _ProjectBottomSheetState extends State<ProjectBottomSheet> {

  Color textColor = Color(0xffD2480A);
  Color subTextColor = Color(0xff999999);
  Color borderColor = Color(0xff0E0E0E);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
              leading: Icon(Icons.share, color: textColor),
              title: Text(
                "Share Project",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              onTap: () {
              }
          ),
          ListTile(
            leading: ImageIcon(
              AssetImage("assets/icons/export.png"),
              color: textColor,
            ),
            title: Text(
              "Export Project",
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          ListTile(
            leading: ImageIcon(
              AssetImage("assets/icons/duplicate.png"),
              color: textColor,
            ),
            title: Text(
              "Duplicate Project",
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          ListTile(
            leading: ImageIcon(
              AssetImage("assets/icons/copy.png"),
              color: textColor,
            ),
            title: Text(
              "Copy to Another Project",
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.print, color: textColor),
            title: Text(
              "Print Project",
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.delete, color: textColor),
            title: Text(
              "Delete Project",
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            child: ListTile(
              leading: Icon(Icons.close, color: textColor),
              title: Text(
                "Cancel",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        color: Colors.white,
                        width: 0.1
                    )
                )
            ),
          )
        ],
      ),
    ); //bottom sheet
  }
}

