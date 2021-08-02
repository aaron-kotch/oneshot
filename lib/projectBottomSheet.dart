import 'package:flutter/material.dart';
import 'package:oneshot/main.dart';

class ProjectBottomSheet extends StatefulWidget {
  const ProjectBottomSheet({Key? key, required this.index}) : super(key: key);

  final int index;

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
            //onTap: () => Navigator.pop(context),
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
            onTap: () {
              showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      backgroundColor: Color(0xff1E1E1E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      title: Text(
                        "Delete Project",
                        style: TextStyle(
                          fontFamily: 'Calibri',
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      content: Text(
                        "Are you sure?",
                        style: TextStyle(
                          fontFamily: 'Calibri',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      actions: [
                        TextButton(
                          child: Text(
                            "No",
                            style: TextStyle(
                              fontFamily: 'Calibri',
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: textColor,
                            ),
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                        TextButton(
                          child: Text(
                            "Yes",
                            style: TextStyle(
                              fontFamily: 'Calibri',
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: textColor,
                            ),
                          ),
                          onPressed: () {
                            MyHomePage.projectList.removeAt(widget.index);
                            Navigator.popUntil(context, (route) => route.isFirst);
                          },
                        ),
                      ],
                    );
                  },
                barrierDismissible: true,
              );
            },
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

