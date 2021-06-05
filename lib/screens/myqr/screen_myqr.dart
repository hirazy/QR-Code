import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qrcode_app/screens/myqr/widget/text_input.dart';

import '../../constants.dart';

class MyQRScreen extends StatefulWidget {
  Function(String) contentCreate;

  MyQRScreen({this.contentCreate, Key key}) : super(key: key);

  @override
  MyQRState createState() => MyQRState();
}

GlobalKey<MyQRState> globalKeyMyQR = GlobalKey();

class MyQRState extends State<MyQRScreen> {
  bool errorInput = false;

  TextEditingController name = TextEditingController();
  TextEditingController company = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController comment = TextEditingController();

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
            textInput("Họ và tên", false, name),
            errorInput == true
                ? Container(
                    margin: EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      "Bắt buộc",
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                : Container(),
            SizedBox(
              height: 10,
            ),
            textInput("Cơ quan", false, company),
            SizedBox(
              height: 10,
            ),
            textInput("Địa chỉ", false, address),
            SizedBox(
              height: 10,
            ),
            textInput("Điện thoại", true, phone),
            SizedBox(
              height: 10,
            ),
            textInput("Email", false, email),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                controller: comment,
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

  void clickCreate() {
    print("clickCreate");

    print(name.text + "@@");

    if (checkStr(name.text) ||
        checkStr(company.text) ||
        checkStr(address.text) ||
        checkStr(phone.text) ||
        checkStr(email.text) ||
        checkStr(comment.text)) {
      String content = "";

      if (checkStr(name.text)) {
        content += name.text;
      }
      if (checkStr(company.text)) {
        content =
            content.length > 0 ? content + "\n" + company.text : company.text;
      }

      if (checkStr(address.text)) {
        content =
            content.length > 0 ? content + "\n" + address.text : address.text;
      }

      if (checkStr(phone.text)) {
        content = content.length > 0 ? content + "\n" + phone.text : phone.text;
      }

      if (checkStr(email.text)) {
        content = content.length > 0 ? content + "\n" + email.text : email.text;
      }

      if (checkStr(comment.text)) {
        content =
            content.length > 0 ? content + "\n" + comment.text : comment.text;
      }

      widget.contentCreate(content);

      setState(() {
        errorInput = false;
      });
      print("MyQRState-clickCreate- true");
    } else {
      print("MyQRState-clickCreate- false");
      setState(() {
        errorInput = true;
      });
    }
  }

  bool checkStr(String s) {
    if (s.isEmpty) {
      return false;
    }
    for (int i = 0; i < s.length; i++) {
      if (s[i] != ' ') {
        return true;
      }
    }
    return false;
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
