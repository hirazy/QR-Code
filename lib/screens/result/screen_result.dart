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
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                cardItemResult(result, () {}, (value) {}),
                Container(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10,),
                  color: Colors.white,
                  child: Text(result.content,
                      style: TextStyle(color: Colors.black, fontSize: 20)),
                ),
                Container(
                  color: Colors.black54,
                  margin: EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      cardOption(Icons.search, "Tìm kiếm trên web", () {}),
                      SizedBox(
                        width: 15,
                      ),
                      cardOption(Icons.share, "Chia sẻ", () {}),
                      SizedBox(
                        width: 15,
                      ),
                      cardOption(Icons.copy, "Sao chép", () {}),
                      SizedBox(
                        width: 15,
                      ),
                      cardOption(
                          Icons.shopping_cart_outlined, "Mua ngay", () {})
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
