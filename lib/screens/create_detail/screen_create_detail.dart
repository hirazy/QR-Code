import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qrcode_app/screens/create_detail/widget/item_create_detail.dart';
import 'package:qrcode_app/screens/create_detail/widget/item_create_label.dart';

class CreateDetailScreen extends StatefulWidget {
  final int type;

  Function(String) contentCreate;

  CreateDetailScreen({this.type, this.contentCreate, Key key})
      : super(key: key);

  @override
  CreateDetailState createState() => CreateDetailState();
}

GlobalKey<CreateDetailState> globalKeyCreateDetail = GlobalKey();

class CreateDetailState extends State<CreateDetailScreen> {
  List<String> labels = [
    "Nội dung từ khay nhớ tạm",
    "Liên kết web",
    "Văn bản",
    "Liên hệ",
    "Email",
    "SMS",
    "Địa lý",
    "Điện thoại",
    "Lịch",
    "Wifi",
    "EAN_8",
    "EAN_13",
    "UPC_E",
    "UPC_A",
    "CODE_39",
    "CODE_93",
    "CODE_128",
    "ITF",
    "PDF_417",
    "CODABAR",
    "DATA_MATRIX",
    "AZTEC"
  ];

  List <String> spinnerItems = [
    'WPA/WPA2',
    'WEP',
    'Không mật khẩu',
  ];

  String contentWifi = "WPA/WPA2";
  bool hideWifi = false;

  int maxLength = 1000;

  bool errorInput = false;

  TextEditingController input1 = TextEditingController();
  TextEditingController input2 = TextEditingController();
  TextEditingController input3 = TextEditingController();
  TextEditingController input4 = TextEditingController();
  TextEditingController input5 = TextEditingController();
  TextEditingController input6 = TextEditingController();

  void init() async {
    if (widget.type == 0) {
      ClipboardData cdata = await Clipboard.getData(Clipboard.kTextPlain);
      String copiedText = cdata.text;
      input1.text = copiedText;
    }
    else if(widget.type == 1){
      input1.text = "http://";
    }
  }

  @override
  Widget build(BuildContext context) {
    int typeCode = widget.type;

    init();

    // init();

    return Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: Column(children: [
              typeCode == 0
                  ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  itemCreateLabel(Icons.text_fields, labels[typeCode]),

                  itemCreateDetail("Văn bản", false, maxLength, 14, input1),
                  errorInput == true ? Container(
                    margin: EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      "Bắt buộc",
                      style: TextStyle(color: Colors.red),
                    ),
                  ) : Container(),
                ],
              )
                  : typeCode == 1
                  ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  itemCreateLabel(Icons.link, labels[typeCode]),
                  itemCreateDetail("", false, maxLength, 1, input1),
                  errorInput == true ? Container(
                    margin: EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      "Bắt buộc",
                      style: TextStyle(color: Colors.red),
                    ),
                  ) : Container()
                ],
              )
                  : typeCode == 2
                  ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  itemCreateLabel(
                      Icons.text_fields, labels[typeCode]),
                  itemCreateDetail(
                      "Văn bản", false, maxLength, 14, input1),
                  errorInput == true ? Container(
                    margin: EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      "Bắt buộc",
                      style: TextStyle(color: Colors.red),
                    ),
                  ) : Container()
                ],
              )
                  : typeCode == 3
                  ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  itemCreateLabel(
                      Icons.person_outline, labels[typeCode]),
                  itemCreateDetail(
                      "Liên hệ", false, maxLength, 1, input1),
                  errorInput == true ? Container(
                    margin: EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      "Bắt buộc",
                      style: TextStyle(color: Colors.red),
                    ),
                  ) : Container(),
                  itemCreateDetail(
                      "Cơ quan", false, maxLength, 1, input2),
                  itemCreateDetail(
                      "Địa chỉ", false, maxLength, 1, input3),
                  itemCreateDetail(
                      "Điện thoại", true, maxLength, 1, input4),
                  itemCreateDetail(
                      "Email", false, maxLength, 1, input5),
                  itemCreateDetail(
                      "Ghi chú", false, maxLength, 12, input6),
                ],
              )
                  : typeCode == 4
                  ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  itemCreateLabel(
                      Icons.email_outlined, labels[typeCode]),
                  itemCreateDetail(
                      "Email", false, maxLength, 1, input1),
                  errorInput == true ? Container(
                    margin: EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      "Bắt buộc",
                      style: TextStyle(color: Colors.red),
                    ),
                  ) : Container(),
                  itemCreateDetail(
                      "Chủ đề", false, maxLength, 1, input2),
                  itemCreateDetail("Nội dung", false,
                      maxLength, 12, input3),
                ],
              )
                  : typeCode == 5
                  ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  itemCreateLabel(Icons.sms_outlined,
                      labels[typeCode]),
                  itemCreateDetail("Điện thoại", true,
                      maxLength, 1, input1),
                  errorInput == true ? Container(
                    margin: EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      "Bắt buộc",
                      style: TextStyle(color: Colors.red),
                    ),
                  ) : Container(),
                  itemCreateDetail("Chủ đề", false,
                      maxLength, 12, input2),
                ],
              )
                  : typeCode == 6
                  ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  itemCreateLabel(
                      Icons.location_on_outlined,
                      labels[typeCode]),
                  itemCreateDetail("Vĩ độ", true,
                      maxLength, 1, input1),
                  errorInput == true ? Container(
                    margin: EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      "Bắt buộc",
                      style: TextStyle(color: Colors.red),
                    ),
                  ) : Container(),
                  itemCreateDetail("Kinh độ", true,
                      maxLength, 1, input2),
                  itemCreateDetail("Truy vấn", false,
                      maxLength, 1, input3),
                ],
              )
                  : typeCode == 7
                  ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  itemCreateLabel(
                      Icons.phone_outlined,
                      labels[typeCode]),
                  itemCreateDetail("Điện thoại",
                      true, maxLength, 1, input1),
                  errorInput == true ? Container(
                    margin: EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      "Bắt buộc",
                      style: TextStyle(color: Colors.red),
                    ),
                  ) : Container(),
                ],
              )
                  : typeCode == 8
                  ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  itemCreateLabel(
                      Icons.calendar_today,
                      labels[typeCode]),
                  itemCreateDetail(
                      "Tên sự kiện",
                      true,
                      maxLength,
                      1,
                      input1),
                  errorInput == true ? Container(
                    margin: EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      "Bắt buộc",
                      style: TextStyle(color: Colors.red),
                    ),
                  ) : Container(),
                  Container(
                      child: Column(

                      )
                  )
                ],
              )
                  : typeCode == 9 ?
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  itemCreateLabel(
                      Icons.wifi,
                      labels[typeCode]),
                  itemCreateDetail(
                      "SSID/Tên mạng",
                      false,
                      maxLength,
                      1,
                      input1),
                  errorInput == true ? Container(
                    margin: EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      "Bắt buộc",
                      style: TextStyle(color: Colors.red),
                    ),
                  ) : Container(),
                  itemCreateDetail(
                      "Mật khẩu",
                      false,
                      maxLength,
                      1,
                      input2),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 15),
                    child: Row(
                      children: [
                        Expanded(child: Text("WPA/WPA2")),
                        DropdownButton<String>(
                          icon: Icon(Icons.arrow_drop_down),
                          onChanged: (value) {

                          },
                          items: spinnerItems.map<DropdownMenuItem<String>>((
                              String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        )
                        ,
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Row(
                      children: [
                        Checkbox(value: hideWifi, onChanged: (value) {
                          setState(() {
                            hideWifi = value;
                          });
                        },
                            checkColor: ThemeData().backgroundColor),
                        Container(
                          margin: EdgeInsets.only(left: 4),
                          child: Text(
                              "Ẩn"
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ) :
              typeCode == 10 ?
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  itemCreateLabel(
                      Icons.qr_code,
                      labels[typeCode]),

                  itemCreateDetail(
                      "",
                      true,
                      7,
                      1,
                      input1),
                  errorInput == true ? Container(
                    margin: EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      "Bắt buộc",
                      style: TextStyle(color: Colors.red),
                    ),
                  ) : Container(),
                ],

              ) : typeCode == 11 ?
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  itemCreateLabel(
                      Icons.qr_code,
                      labels[typeCode]),
                  itemCreateDetail("", true, 12, 1, input1),
                  errorInput == true ? Container(
                    margin: EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      "Bắt buộc",
                      style: TextStyle(color: Colors.red),
                    ),
                  ) : Container(),
                ],
              ) :
              typeCode == 12 ?
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  itemCreateLabel(
                      Icons.qr_code,
                      labels[typeCode]),
                  itemCreateDetail("", true, 8, 1, input1),
                  errorInput == true ? Container(
                    margin: EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      "Bắt buộc",
                      style: TextStyle(color: Colors.red),
                    ),
                  ) : Container(),
                ],
              ) : typeCode == 13 ?
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  itemCreateLabel(
                      Icons.qr_code,
                      labels[typeCode]),
                  itemCreateDetail("", true, 12, 1, input1),
                  errorInput == true ? Container(
                    margin: EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      "Bắt buộc",
                      style: TextStyle(color: Colors.red),
                    ),
                  ) : Container(),
                ],
              ) : typeCode == 14 ?
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  itemCreateLabel(
                      Icons.qr_code,
                      labels[typeCode]),
                  itemCreateDetail("", false, maxLength, 12, input1),
                  errorInput == true ? Container(
                    margin: EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      "Bắt buộc",
                      style: TextStyle(color: Colors.red),
                    ),
                  ) : Container(),
                ],
              ) :
              typeCode == 15 ?
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  itemCreateLabel(
                      Icons.qr_code,
                      labels[typeCode]),
                  itemCreateDetail("", false, maxLength, 12, input1),
                  errorInput == true ? Container(
                    margin: EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      "Bắt buộc",
                      style: TextStyle(color: Colors.red),
                    ),
                  ) : Container(),
                ],
              ) : typeCode == 16 ?
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  itemCreateLabel(
                      Icons.qr_code,
                      labels[typeCode]),
                  itemCreateDetail("", false, maxLength, 12, input1),
                  errorInput == true ? Container(
                    margin: EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      "Bắt buộc",
                      style: TextStyle(color: Colors.red),
                    ),
                  ) : Container(),
                ],
              ) : typeCode == 17 ?
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  itemCreateLabel(
                      Icons.qr_code,
                      labels[typeCode]),
                  itemCreateDetail("", true, maxLength, 1, input1),
                  errorInput == true ? Container(
                    margin: EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      "Bắt buộc",
                      style: TextStyle(color: Colors.red),
                    ),
                  ) : Container(),
                ],
              ) : typeCode == 18 ?
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  itemCreateLabel(
                      Icons.qr_code,
                      labels[typeCode]),
                  itemCreateDetail("", false, maxLength, 12, input1),
                  errorInput == true ? Container(
                    margin: EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      "Bắt buộc",
                      style: TextStyle(color: Colors.red),
                    ),
                  ) : Container(),
                ],
              ) : typeCode == 19 ?
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  itemCreateLabel(
                      Icons.qr_code,
                      labels[typeCode]),
                  itemCreateDetail("", true, maxLength, 1, input1),
                  errorInput == true ? Container(
                    margin: EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      "Bắt buộc",
                      style: TextStyle(color: Colors.red),
                    ),
                  ) : Container(),
                ],
              ) : typeCode == 20 ?
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  itemCreateLabel(
                      Icons.qr_code,
                      labels[typeCode]),
                  itemCreateDetail("", false, maxLength, 12, input1),
                  errorInput == true ? Container(
                    margin: EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      "Bắt buộc",
                      style: TextStyle(color: Colors.red),
                    ),
                  ) : Container(),
                ],
              ) :
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  itemCreateLabel(
                      Icons.qr_code,
                      labels[typeCode]),
                  itemCreateDetail("", false, maxLength, 12, input1),
                  errorInput == true ? Container(
                    margin: EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      "Bắt buộc",
                      style: TextStyle(color: Colors.red),
                    ),
                  ) : Container(),
                ],
              )
              // typeCode == 1?
              //     itemCreateDetail("", inputNumber, maxLengths, maxLines, controller)
            ]),
          ),
        ));
  }

  void clickCreate() {
    int type = widget.type;

    String content = "";
    switch (type) {
      case 0:
        typeClick1();
        break;
      case 1:
        typeClick1();
        break;
      case 2:
        typeClick1();
        break;
      case 3:
        typeClick6();
        break;
      case 4:
        typeClick3();
        break;
      case 5:
        typeClick2();
        break;
      case 6:
        typeClick3();
        break;
      case 7:
        typeClick1();
        break;
      case 8:
        typeClick1();
        break;
      default:
        typeClick1();
        break;
    }
  }

  void typeClick1(){
    String content = input1.text;
    if(!checkStr(content)){
      setState(() {
        errorInput = true;
      });
    }
    else{
      widget.contentCreate(content);
    }
  }

  void typeClick2(){
    if(checkStr(input1.text) || checkStr(input2.text)){
      String content = "";
      if(checkStr(input1.text)){
        content += input1.text;
      }
      if(checkStr(input2.text)){
        if(!content.isEmpty){
          content += "\n" + input2.text;
        }
        else{
          content += input2.text;
        }
      }
    }
    else{
      setState(() {
        errorInput = true;
      });
    }
  }

  void typeClick3(){
    if(checkStr(input1.text) || checkStr(input2.text) || checkStr(input3.text)){
      String content = "";
      if(checkStr(input1.text)){
        content += input1.text;
      }
      if(checkStr(input2.text)){
        if(!content.isEmpty){
          content += "\n" + input2.text;
        }
        else{
          content += input2.text;
        }
      }
      if(checkStr(input3.text)){
        if(!content.isEmpty){
          content += "\n" + input3.text;
        }
        else{
          content += input3.text;
        }
      }
      widget.contentCreate(content);
    }
    else{
      setState(() {
        errorInput = true;
      });
    }
  }

  void typeClick4(){
    if (checkStr(input1.text) ||
        checkStr(input2.text) ||
        checkStr(input3.text) ||
        checkStr(input4.text)  ) {
      String content = "";

      if (checkStr(input1.text)) {
        content += input1.text;
      }
      if (checkStr(input2.text)) {
        content =
        content.length > 0 ? content + "\n" + input2.text : input2.text;
      }

      if (checkStr(input3.text)) {
        content =
        content.length > 0 ? content + "\n" + input3.text : input3.text;
      }

      if (checkStr(input4.text)) {
        content = content.length > 0 ? content + "\n" + input4.text : input4.text;
      }

      widget.contentCreate(content);
    } else {
      setState(() {
        errorInput = true;
      });
    }
  }

  void typeClick5(){
    if (checkStr(input1.text) ||
        checkStr(input2.text) ||
        checkStr(input3.text) ||
        checkStr(input4.text) ||
        checkStr(input5.text) ) {
      String content = "";

      if (checkStr(input1.text)) {
        content += input1.text;
      }
      if (checkStr(input2.text)) {
        content =
        content.length > 0 ? content + "\n" + input2.text : input2.text;
      }

      if (checkStr(input3.text)) {
        content =
          content.length > 0 ? content + "\n" + input3.text : input3.text;
      }

      if (checkStr(input4.text)) {
        content = content.length > 0 ? content + "\n" + input4.text : input4.text;
      }

      if (checkStr(input5.text)) {
        content = content.length > 0 ? content + "\n" + input5.text : input5.text;
      }

      widget.contentCreate(content);
    } else {
      setState(() {
        errorInput = true;
      });
    }
  }

  void typeClick6(){
    if (checkStr(input1.text) ||
        checkStr(input2.text) ||
        checkStr(input3.text) ||
        checkStr(input4.text) ||
        checkStr(input5.text) ||
        checkStr(input6.text)) {
      String content = "";

      if (checkStr(input1.text)) {
        content += input1.text;
      }
      if (checkStr(input2.text)) {
        content =
        content.length > 0 ? content + "\n" + input2.text : input2.text;
      }

      if (checkStr(input3.text)) {
        content =
        content.length > 0 ? content + "\n" + input3.text : input3.text;
      }

      if (checkStr(input4.text)) {
        content = content.length > 0 ? content + "\n" + input4.text : input4.text;
      }

      if (checkStr(input5.text)) {
        content = content.length > 0 ? content + "\n" + input5.text : input5.text;
      }

      if (checkStr(input6.text)) {
        content =
        content.length > 0 ? content + "\n" + input6.text : input6.text;
      }

      widget.contentCreate(content);
    } else {
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
