import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qrcode_app/screens/myqr/widget/text_input.dart';

import '../../constants.dart';

class MyQRScreen extends StatefulWidget {
  @override
  MyQRState createState() => MyQRState();
}

class MyQRState extends State<MyQRScreen> {
  bool errorInput = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 25),
                      child: Icon(Icons.person_outline),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text("QR của tôi"),
                    )
                  ],
                )),
            Container(
                margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Text(
                  tvCreateTitle,
                )),
            Container(
              margin: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Text(tvCreateContent),
            ),
            SizedBox(
              height: 10,
            ),
            textInput("Họ và tên"),
            Container(
              child: Visibility(
                visible: errorInput,
                child: Text(
                  "Bắt buộc",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            textInput("Cơ quan"),
            SizedBox(
              height: 10,
            ),
            textInput("Địa chỉ"),
            SizedBox(
              height: 10,
            ),
            textInput("Điện thoại"),
            SizedBox(
              height: 10,
            ),
            textInput("Email"),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                maxLines: 6,
                decoration: InputDecoration(
                  hintText: "Ghi chú",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Container(
// padding: EdgeInsets.only(top: 10, bottom: 10),
// color: Colors.white10,
// child:Row(
// children: [
// Container(
// child: Icon(Icons.person_outline, color: Colors.black),
// ),
// Expanded(
// flex: 1,
// child: Container(
// child: Text(
// "QR của tôi"
// ),
// ),
// ),
// Container(
// margin: EdgeInsets.only(right: 15),
// child: InkWell(
// child: Icon(Icons.save_outlined),
// onTap: (){
//
// },
// ),
// ),
// Container(
// margin: EdgeInsets.only(right: 20),
// child: InkWell(
// child: Icon(Icons.favorite),
// onTap: (){
//
// },
// ),
//
// )
// ],
// ),
// )
