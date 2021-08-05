import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oneshot/main.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    Color orangeAccent = Color(0xffD5754A);

    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xff1E1E1E),
          body: Container(
            height: height,
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 32, left: 4, bottom: 32),
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios_rounded),
                    iconSize: 20,
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, bottom: 12),
                  child: Text(
                    "STORAGE / BACKUP",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: orangeAccent
                    ),
                  ),
                ), // storage section
                Container(
                  width: width,
                  alignment: Alignment.centerLeft,
                  child: TextButton.icon(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
                      side: BorderSide(
                        color: Color(0xff464646),
                        width: 0.2
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      )
                    ),
                    icon: Icon(
                      Icons.cloud,
                      size: 20,
                      color: orangeAccent,
                    ),
                    label: Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 24),
                        child: Text(
                          'iCloud Sync',
                          style: TextStyle(
                            fontFamily: 'CenturyGothic',
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    onPressed: () {

                    },
                  )
                ), // icloudSync button
                Container(
                    width: width,
                    alignment: Alignment.centerLeft,
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
                          side: BorderSide(
                              color: Color(0xff464646),
                              width: 0.2
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          )
                      ),
                      icon: ImageIcon(
                        AssetImage("assets/icons/google_drive.png"),
                        size: 20,
                        color: orangeAccent,
                      ),
                      label: Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 24),
                          child: Text(
                            'Google Drive',
                            style: TextStyle(
                              fontFamily: 'CenturyGothic',
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {

                      },
                    )
                ), // google drive button
                Container(
                    width: width,
                    alignment: Alignment.centerLeft,
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
                          side: BorderSide(
                              color: Color(0xff464646),
                              width: 0.2
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          )
                      ),
                      icon: ImageIcon(
                        AssetImage("assets/icons/onedrive.png"),
                        size: 20,
                        color: orangeAccent,
                      ),
                      label: Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 24),
                          child: Text(
                            'iCloud Sync',
                            style: TextStyle(
                              fontFamily: 'CenturyGothic',
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {

                      },
                    )
                ), // onedrive button
                Container(
                  padding: EdgeInsets.only(top: 32, left: 20, bottom: 12),
                  child: Text(
                    "PRIVACY",
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: orangeAccent
                    ),
                  ),
                ), // privacy section
                Container(
                    width: width,
                    alignment: Alignment.centerLeft,
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
                          side: BorderSide(
                              color: Color(0xff464646),
                              width: 0.2
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          )
                      ),
                      icon: ImageIcon(
                        AssetImage("assets/icons/face_id.png"),
                        size: 20,
                        color: orangeAccent,
                      ),
                      label: Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 24),
                          child: Text(
                            'Face ID',
                            style: TextStyle(
                              fontFamily: 'CenturyGothic',
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {

                      },
                    )
                ), // face id button
                Container(
                    width: width,
                    alignment: Alignment.centerLeft,
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
                          side: BorderSide(
                              color: Color(0xff464646),
                              width: 0.2
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          )
                      ),
                      icon: ImageIcon(
                        AssetImage("assets/icons/password.png"),
                        size: 20,
                        color: orangeAccent,
                      ),
                      label: Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 24),
                          child: Text(
                            'Passcode',
                            style: TextStyle(
                              fontFamily: 'CenturyGothic',
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {

                      },
                    )
                ), // passcode button
                Container(
                  padding: EdgeInsets.only(top: 32, left: 20, bottom: 12),
                  child: Text(
                    "DISPLAY",
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: orangeAccent
                    ),
                  ),
                ), // privacy section
                Container(
                    width: width,
                    alignment: Alignment.centerLeft,
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
                          side: BorderSide(
                              color: Color(0xff464646),
                              width: 0.2
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          )
                      ),
                      icon: ImageIcon(
                        AssetImage("assets/icons/moon.png"),
                        size: 20,
                        color: orangeAccent,
                      ),
                      label: Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 24),
                          child: Text(
                            'Dark Mode',
                            style: TextStyle(
                              fontFamily: 'CenturyGothic',
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {

                      },
                    )
                ), // face id button
                Container(
                    width: width,
                    alignment: Alignment.centerLeft,
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
                          side: BorderSide(
                              color: Color(0xff464646),
                              width: 0.2
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          )
                      ),
                      icon: Icon(
                        Icons.language,
                        size: 20,
                        color: orangeAccent,
                      ),
                      label: Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 24),
                          child: Text(
                            'Language',
                            style: TextStyle(
                              fontFamily: 'CenturyGothic',
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {

                      },
                    )
                ), // passcode button
              ],
            ),
          ),
        )
    );
  }

  void test() {

  }
}

Route toMain() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => MyHomePage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(-1, 0);
        var end = Offset.zero;
        var curve = Curves.easeInQuad;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      }
  );
}
