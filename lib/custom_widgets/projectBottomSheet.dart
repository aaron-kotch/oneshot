import 'dart:core';
import 'package:flutter/material.dart';
import 'package:oneshot/main.dart';
import '../classes/Projects.dart';
import '../main.dart';

class ProjectBottomSheet extends StatefulWidget {
  ProjectBottomSheet({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  _ProjectBottomSheetState createState() => _ProjectBottomSheetState();
}

class _ProjectBottomSheetState extends State<ProjectBottomSheet> {

  List<bool> valueList = List.filled(MyHomePage.projectList.length, false);

  final Color textColor = const Color(0xffD2480A);
  final Color subTextColor = const Color(0xff999999);
  final Color borderColor = const Color(0xff0E0E0E);
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final double width = MediaQuery.of(context).size.width;

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
                      "Duplicate Project?",
                      style: TextStyle(
                        fontFamily: 'Calibri',
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    content: Text(
                      "Project will be duplicated",
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
                          List dup = MyHomePage.projectList[widget.index];
                          Projects currProj = dup[0];

                          final List<String> oldProjName = currProj.projectName.split(" ");
                          final int projCount;
                          final String projNameString;

                          int count = 0;
                          int dupCount = -1;

                          //insertion slot
                          for (var i in MyHomePage.projectList) {
                            if (i[0].projectName.split(" ")[1] == oldProjName[1]) {
                              count = MyHomePage.projectList.indexOf(i);
                              print(count);
                              dupCount++;
                            }
                          }

                          List lastElement = MyHomePage.projectList[count];

                          //set name/numbering
                          if (currProj.projectName.contains("(") || dupCount > 0) {
                            projCount = int.parse(lastElement[0].projectName.split(" ")[2].split("(")[1].split(")")[0]);
                            projNameString = "${oldProjName[0]} ${oldProjName[1]} (${projCount + 1})";

                          } else {
                            print("zero");
                            projNameString = "${oldProjName[0]} ${oldProjName[1]} (1)";
                          }

                          Projects dupProject = new Projects(
                              "$projNameString",
                              currProj.company, currProj.title,
                              currProj.prepareBy, currProj.budgetDate,
                              currProj.shootDays, currProj.producers,
                              currProj.union, currProj.location
                          );

                          MyHomePage.projectList.insert(count + 1, [dupProject, dup[1]]);

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              //behavior: SnackBarBehavior.floating,
                              duration: Duration(seconds: 1),
                              padding: EdgeInsets.only(bottom: 4, left: 28),
                              backgroundColor: Color(0xff171717),
                              content: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 16),
                                    child: Icon(
                                      Icons.done_rounded,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "Project duplicated",
                                    style: TextStyle(
                                        fontFamily: 'Calibri',
                                        fontWeight: FontWeight.w300,
                                        fontSize: 16,
                                        color: Colors.white,
                                        height: 1.6
                                    ),
                                  ),
                                ],
                              ),
                            ));

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
            onTap: () {
              showDialog(
                context: context,
                builder: (_) {
                  return StatefulBuilder(
                      builder: (context, setState) {
                        return Dialog(
                            backgroundColor: Color(0xff1E1E1E),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Container(
                              constraints: BoxConstraints(maxHeight: 600, maxWidth: width),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.only(left: 24, top: 28, bottom: 20),
                                    child: Text(
                                      "Copy to:",
                                      style: TextStyle(
                                        fontFamily: 'Calibri',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: MyHomePage.projectList.length,
                                    itemBuilder: (context, index) {

                                      if (index == widget.index) {
                                        return Container(color: Colors.yellow);
                                      }
                                      return Theme(
                                        data: ThemeData(unselectedWidgetColor: Colors.grey[200]),
                                        child: CheckboxListTile(
                                          activeColor: textColor,
                                          contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 24),
                                          title: Text(
                                            MyHomePage.projectList[index][0].projectName,
                                            style: TextStyle(
                                              fontFamily: 'Calibri',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 20,
                                              color: Colors.white,
                                            ),
                                          ),
                                          controlAffinity: ListTileControlAffinity.leading,
                                          value: valueList[index],
                                          onChanged: (bool? val) {
                                            setState(() {
                                              valueList[index] = val!;
                                            });
                                          },
                                        ),
                                      );

                                    },
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        TextButton(
                                          child: Text(
                                            "Cancel",
                                            style: TextStyle(
                                              fontFamily: 'Calibri',
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16,
                                              color: textColor,
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        TextButton(
                                          child: Text(
                                            "Copy",
                                            style: TextStyle(
                                              fontFamily: 'Calibri',
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16,
                                              color: textColor,
                                            ),
                                          ),
                                          onPressed: () async {

                                            copyProject();

                                          },
                                        ),
                                      ],
                                    ),
                                    padding: EdgeInsets.all(12),
                                  )
                                ],
                              ),
                            )
                        );
                      }
                  );
                },
                barrierDismissible: true,
              );
            },
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
                      "Delete Project?",
                      style: TextStyle(
                        fontFamily: 'Calibri',
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    content: Text(
                      "Project will be moved to bin",
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
                          MyHomePage.projectList.removeAt(this.widget.index);
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

  void copyProject() async {

    Projects currProject = MyHomePage.projectList[widget.index][0];

    for (int i = 0; i < valueList.length; i++) {
      if (valueList[i] == true) {
        String oldName = MyHomePage.projectList[i][0].projectName;

        MyHomePage.projectList.replaceRange(i, i + 1, [
          [new Projects(
              oldName,
              currProject.projectName,
              currProject.title,
              currProject.prepareBy,
              currProject.budgetDate,
              currProject.shootDays,
              currProject.producers,
              currProject.union,
              currProject.location), MyHomePage.projectList[widget.index][1]]
        ]);
      }
    }
  }

}

