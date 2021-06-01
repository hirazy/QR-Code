import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qrcode_app/constants.dart';
import 'package:qrcode_app/model/qrcode.dart';

Card cardItemQR(QRCode item, type, tapAction, selectItemMenu, tapItem) {
  return Card(
    child: InkWell(
      onTap: tapItem,
      child: Card(
        color: Colors.white,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              margin: EdgeInsets.only(left: 10),
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
              child: Column(
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
                style: TextStyle(color: Colors.white70),
              ),
            ],
          )),
          Container(
            margin: EdgeInsets.only(right: 15),
            child: FlatButton(
                onPressed: tapAction,
                child: type == TYPE_FAVORITE ? Icon(Icons.menu) : item.isFavorite
                    ? Icon(Icons.favorite)
                    : Icon(Icons.favorite_border)),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: FlatButton(
                onPressed: () {
                  PopupMenuButton(
                      onSelected: (value) {
                        selectItemMenu(value);
                      },
                      iconSize: 6,
                      child: Center(child: Text('click here')),
                      itemBuilder: (context) => [
                            PopupMenuItem(
                                value: 1,
                                child: Icon(Icons.restore_from_trash)),
                            PopupMenuItem(value: 2, child: Icon(Icons.add)),
                            PopupMenuItem(value: 3, child: Icon(Icons.add)),
                            PopupMenuItem(value: 4, child: Icon(Icons.add)),
                            PopupMenuItem(value: 5, child: Icon(Icons.add)),
                            PopupMenuItem(value: 6, child: Icon(Icons.add)),
                          ]);
                },
                child: Icon(Icons.more_vert)),
          )
        ]),
      ),
    ),
  );
}
