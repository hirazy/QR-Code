import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qrcode_app/model/qrcode.dart';
import 'package:qrcode_app/screens/result/widget/card_item_option.dart';
import 'package:qrcode_app/screens/result/widget/card_item_result.dart';

class ResultScreen extends StatefulWidget {
  static const String routeName = "/result";
  QRCode code;

  ResultScreen({this.code});

  @override
  State<ResultScreen> createState() => ResultState();
}

class ResultState extends State<ResultScreen> {


  @override
  Widget build(BuildContext context) {

    QRCode result = widget.code;

    return Scaffold(
        backgroundColor: Colors.white10,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                cardItemResult(result, () {}, (value) {}),
                Container(
                  padding:
                      EdgeInsets.only(top: 10, left: 10, bottom: 10, right: 15),
                  color: Colors.white,
                  child:
                      Text(result.content, style: TextStyle(color: Colors.black)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    cardOption(Icons.search, "Tìm kiếm trên web", () {}),
                    cardOption(Icons.share, "Chia sẻ", () {}),
                    cardOption(Icons.copy, "Sao chép", () {}),
                    cardOption(Icons.shopping_cart_outlined, "Mua ngay", () {})
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text("ga vc"),
                )
              ],
            ),
          ),
        ));
  }
}
