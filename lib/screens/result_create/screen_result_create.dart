import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ResultCreateScreen extends StatefulWidget {
  int type;
  String content;

  ResultCreateScreen({this.type, this.content});

  @override
  ResultCreateState createState() => ResultCreateState();
}

class ResultCreateState extends State<ResultCreateScreen> {
  @override
  Widget build(BuildContext context) {
    int type = widget.type;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Color.fromRGBO(153, 153, 153, 0.2627450980392157),
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Icon(
                      // change
                      Icons.text_fields,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          "Văn bản",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    child: InkWell(
                      child: Icon(
                        Icons.save_outlined,
                        color: Colors.black54,
                      ),
                      onTap: () {},
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    child: InkWell(
                      child: Icon(Icons.star_border_outlined,
                          color: Colors.black54),
                      onTap: () {},
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: Container(
                  margin: EdgeInsets.only(top: 60),
                  padding: EdgeInsets.only(bottom: 60),
                  child: BarcodeWidget(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height:  type < 10 ? MediaQuery.of(context).size.width * 0.7: MediaQuery.of(context).size.width * 0.3,
                    barcode: type < 10 ? Barcode.qrCode(): type == 10 ? Barcode.ean8():
                        type == 11? Barcode.ean13(): type == 12? Barcode.upcE():type == 13?
                            Barcode.upcA(): type == 14? Barcode.code39(): type == 15? Barcode.code93():
                            type == 16 ? Barcode.code128(): type == 17 ? Barcode.itf(): type == 18 ? Barcode.pdf417():
                            type == 19? Barcode.codabar(): type == 20? Barcode.dataMatrix(): Barcode.aztec(),
                    data: widget.content,
                  )),
            ),
            Container(
              color: Color.fromRGBO(153, 153, 153, 0.2627450980392157),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 30),
                          child: InkWell(
                            onTap: () {},
                            child: Column(children: [
                              Icon(
                                Icons.save,
                                color: ThemeData().primaryColor,
                                size: 50,
                              ),
                              Text(
                                "Lưu lại",
                                style: TextStyle(color: Colors.black),
                              )
                            ]),
                          )),
                      Container(
                          margin: EdgeInsets.only(left: 50),
                          child: InkWell(
                            onTap: () {},
                            child: Column(children: [
                              Icon(Icons.share_outlined,
                                  color: ThemeData().primaryColor, size: 50),
                              Text(
                                "Chia sẻ",
                                style: TextStyle(color: Colors.black),
                              )
                            ]),
                          ))
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 20),
                    margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Text(
                      widget.content,
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
