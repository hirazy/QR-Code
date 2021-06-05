import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qrcode_app/blocs/flash_bloc.dart';
import 'package:qrcode_app/screens/setting/widget/item_card_setting.dart';
import 'package:qrcode_app/utils/SharePreferenceUtils.dart';

class SettingScreen extends StatefulWidget {
  @override
  SettingState createState() => SettingState();
}

class SettingState extends State<SettingScreen> {
  bool beep = false;
  bool vibrate = false;
  bool clipBoard = true;

  bool informationUrl = false;
  bool batchScan = false;
  bool autoNet = true;
  bool touchFocus = false;
  bool duplicateCode = true;
  bool customAction = false;
  bool useBrowse = false;


  bool autoFocus = false;

  bool openWebLink = false;
  bool invertScan = false;

  int indexColor = SharePreferenceUtils.getColorTheme();

  List<Color> colors = [
    Colors.blue,
    Colors.red,
    Colors.deepOrange,
    Colors.yellow,
    Colors.green,
    Colors.greenAccent,
    Colors.lightBlueAccent,
    Colors.blueAccent,
    Colors.cyan,
    Colors.purple,
    Colors.pinkAccent,
    Colors.black38
  ];

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
  //  final FlashBloc counterBloc = context.bloc<FlashBloc>();

    return Scaffold(
        body: ListView(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 10, top: 10),
            child: Text(
              "Bảng màu",
              style: TextStyle(color: Colors.black),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15, left: 10, right: 10),
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              // to disable GridView's scrolling
              shrinkWrap: true,
              // You won't see infin
              itemCount: 12,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6, crossAxisSpacing: 5, mainAxisSpacing: 5),
              itemBuilder: (_, int index) {
                return InkWell(
                    onTap: () {
                      setState(() {
                        indexColor = index;
                        SharePreferenceUtils.setColorTheme(index);
                      });
                    },
                    child: Container(
                      child: indexColor == index
                          ? Icon(
                              Icons.check,
                              color: Colors.white,
                            )
                          : Text(""),
                      decoration: BoxDecoration(
                          color: colors[index],
                          borderRadius: BorderRadius.circular(10)),
                    ));
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: ListTile(title: Text("Chủ đề",),
            subtitle: Text("Mặc định hệ thống"),
            onTap: (){
              showDialog(
                context: context,
                builder: (_)=> AlertDialog(
                  actions: [
                    ListTile(
                      onTap:(){

                      },
                      leading: Text("ssa"),
                      title: Text("Sáng")
                    )
                  ],
                ),
                barrierDismissible: false
              );
            },),
          ),
          itemSetting("Bíp", "", beep, (value){
            setState(() {
              beep = value;
            });
          }),
          itemSetting("Rung", "", vibrate, (value){
            setState(() {
              vibrate = value;
            });
          }),
          itemSetting("Sao chép vào bảng tạm", "", clipBoard, (value){
            setState(() {
              clipBoard = value;
            });
          }),
          itemSetting("Thông tin URL", "Cố gắng truy xuất thêm thông tin về URL", informationUrl,(value){
            setState(() {
              informationUrl = value;
            });
          }),
          itemSetting("Thông tin URL", "Cố gắng truy xuất thêm thông tin về URL", informationUrl,(value){
            setState(() {
              informationUrl = value;
            });
          }),
          itemSetting("Thông tin URL", "Cố gắng truy xuất thêm thông tin về URL", informationUrl,(value){
            setState(() {
              informationUrl = value;
            });
          })
        ],
      ),
    ]));
  }

  void getData() {
    setState() {}
  }
}
