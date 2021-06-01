import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qrcode_app/screens/create/widget/item_create_qr.dart';
import 'package:qrcode_app/screens/create/widget/item_divide_create.dart';

import '../../constants.dart';

class CreateScreen extends StatefulWidget {
  @override
  CreateState createState() => CreateState();
}

class CreateState extends State<CreateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 15),
              child: Text(
                "Tạo QR",
                style: TextStyle(color: Colors.black),
              ),
            ),
            Expanded(
              flex: 1,
                child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    margin: EdgeInsets.only(top: 10, left: 5, right: 5),
                    child: ListView(
                      children: [
                        itemCreate(Icons.assignment_outlined,
                            "Nội dung từ khay nhớ tạm"),
                        itemDividerCreate(),
                        itemCreate(Icons.link, "Liên kết web"),
                        itemDividerCreate(),
                        itemCreate(Icons.text_fields, "Văn bản"),
                        itemDividerCreate(),
                        itemCreate(Icons.person_outline, "Liên hệ"),
                        itemDividerCreate(),
                        itemCreate(Icons.email_outlined, "Email"),
                        itemDividerCreate(),
                      ],
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
