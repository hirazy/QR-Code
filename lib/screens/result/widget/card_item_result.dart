import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qrcode_app/constants.dart';
import 'package:qrcode_app/model/qrcode.dart';

Card cardItemResult(QRCode item, tapChangeName, selectItemMenu) {
  return Card(
    color: Colors.white,
    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
          child: item.type == TYPE_TEXT
              ? Icon(Icons.text_fields)
              : item.type == TYPE_BARCODE
                  ? Icon(Icons.code)
                  : item.type == TYPE_PRODUCT
                      ? Icon(Icons.check_box_outline_blank)
                      : item.type == TYPE_PERSON
                          ? Icon(Icons.person)
                          : Icon(Icons.link)),
      Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.title != ""
                  ? item.title
                  : item.type == TYPE_TEXT
                      ? "Văn bản"
                      : item.type == TYPE_BARCODE
                          ? "Mã vạch"
                          : item.type == TYPE_PRODUCT
                              ? "Sản phẩm"
                              : item.type == TYPE_PERSON
                                  ? "Cá nhân"
                                  : "Liên kết web",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              item.time.toString() + '\n' + item.content,
              style: TextStyle(color: Colors.black38),
            ),
          ],
        ),
      )),
      Container(
        margin: EdgeInsets.only(right: 15),
        child: InkWell(
          onTap: () {},
          child: Icon(Icons.save_rounded),
        ),
      ),
      Container(
        margin: EdgeInsets.only(right: 15),
        child: InkWell(
            onTap: () {},
            child: item.isFavorite
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border)),
      ),
    ]),
  );
}
