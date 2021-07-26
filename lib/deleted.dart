import 'package:flutter/material.dart';

class Deleted extends StatefulWidget {
  const Deleted({Key? key}) : super(key: key);

  @override
  _DeletedState createState() => _DeletedState();
}

class _DeletedState extends State<Deleted> {
  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff1E1E1E),
        body: Container(
          height: height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 28, left: 16, right: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_rounded,
                          size: 20,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Container(
                        child: Text(
                          'Recently Deleted',
                          style: TextStyle(
                            fontFamily: 'Calibri',
                            fontWeight: FontWeight.w300,
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Edit',
                          style: TextStyle(
                            fontFamily: 'Calibri',
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),)
                    ],
                  ),
                ),
              ),
              Container(
                width: width,
                padding: EdgeInsets.only(top: 20, left: 23, right: 24, bottom: 16),
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
                width: width,
                padding: EdgeInsets.symmetric(horizontal: 28),
                child: Text(
                  "Notes are available here for 30 days. After that time, notes will be permanently deleted. This may take up to 40 days.",
                  style: TextStyle(
                    fontFamily: "CenturyGothic",
                    color: Colors.grey[500],
                    fontSize: 10
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: width,
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[600],
                    borderRadius: BorderRadius.circular(12)
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
