import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qrcode_app/screens/create/widget/item_create_qr.dart';
import 'package:qrcode_app/screens/create/widget/item_divide_create.dart';

import '../../constants.dart';

class CreateScreen extends StatefulWidget {

  Function(int) typeCreate;

  CreateScreen({this.typeCreate});

  @override
  CreateState createState() => CreateState();
}

GlobalKey<CreateState> globalKeyCreate = GlobalKey();

class CreateState extends State<CreateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 15),
                        child: Text(
                          "Tạo QR",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        margin: EdgeInsets.only(top: 10, left: 5, right: 5),
                        child: ListView(
                          shrinkWrap: true,
                          primary: false,
                          children: [
                            itemCreate(Icons.assignment_outlined,
                                "Nội dung từ khay nhớ tạm", () {
                                  widget.typeCreate(0);
                                }),
                            itemDividerCreate(),
                            itemCreate(Icons.link, "Liên kết web", () {
                              widget.typeCreate(1);
                            }),
                            itemDividerCreate(),
                            itemCreate(Icons.text_fields, "Văn bản", () {
                              widget.typeCreate(2);
                            }),
                            itemDividerCreate(),
                            itemCreate(Icons.person_outline, "Liên hệ", () {
                              widget.typeCreate(3);
                            }),
                            itemDividerCreate(),
                            itemCreate(Icons.email_outlined, "Email", () {
                              widget.typeCreate(4);
                            }),
                            itemDividerCreate(),
                            itemCreate(Icons.sms_outlined, "SMS", () {
                              widget.typeCreate(5);
                            }),
                            itemDividerCreate(),
                            itemCreate(
                                Icons.location_on_outlined, "Địa lý", () {
                              widget.typeCreate(6);
                            }),
                            itemDividerCreate(),
                            itemCreate(
                                Icons.phone_outlined, "Điện thoại", () {
                              widget.typeCreate(7);
                            }),
                            itemDividerCreate(),
                            itemCreate(Icons.calendar_today, "Lịch", () {
                              widget.typeCreate(8);
                            }),
                            itemDividerCreate(),
                            itemCreate(Icons.wifi, "Wifi", () {
                              widget.typeCreate(9);
                            }),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 15),
                        child: Text(
                          "Các loại khác",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        margin: EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 10),
                        child: ListView(
                          shrinkWrap: true,
                          primary: false,
                          children: [
                            itemCreate(Icons.qr_code,
                                "EAN_8", () {
                                  widget.typeCreate(10);
                                }),
                            itemDividerCreate(),
                            itemCreate(Icons.qr_code, "EAN_13", () {
                              widget.typeCreate(11);
                            }),
                            itemDividerCreate(),
                            itemCreate(Icons.qr_code, "UPC_#", () {
                              widget.typeCreate(12);
                            }),
                            itemDividerCreate(),
                            itemCreate(Icons.qr_code, "UPC_A", () {
                              widget.typeCreate(13);
                            }),
                            itemDividerCreate(),
                            itemCreate(Icons.qr_code, "CODE_39", () {
                              widget.typeCreate(14);
                            }),
                            itemDividerCreate(),
                            itemCreate(
                                Icons.qr_code, "CODE_93", () {
                              widget.typeCreate(15);
                            }),
                            itemDividerCreate(),
                            itemCreate(
                                Icons.qr_code, "CODE_128", () {
                              widget.typeCreate(16);
                            }),
                            itemDividerCreate(),
                            itemCreate(Icons.qr_code, "ITF", () {
                              widget.typeCreate(17);
                            }),
                            itemDividerCreate(),
                            itemCreate(Icons.qr_code, "PDF_147", () {
                              widget.typeCreate(18);
                            }),
                            itemDividerCreate(),
                            itemCreate(Icons.qr_code, "CODABAR", () {
                              widget.typeCreate(19);
                            }),
                            itemDividerCreate(),
                            itemCreate(Icons.qr_code, "DATA_MATRIX", () {
                              widget.typeCreate(20);
                            }),
                            itemDividerCreate(),
                            itemCreate(Icons.qr_code, "AZTEC", () {
                              widget.typeCreate(21);
                            }),
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
