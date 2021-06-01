import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qrcode_app/db/database_provider.dart';
import 'package:qrcode_app/model/qrcode.dart';
import 'package:qrcode_app/screens/create/screen_create.dart';
import 'package:qrcode_app/screens/favorite/screen_favorite.dart';
import 'package:qrcode_app/screens/history/screen_history.dart';
import 'package:qrcode_app/screens/main/widget/item_action.dart';
import 'package:qrcode_app/screens/main/widget/item_divider.dart';
import 'package:qrcode_app/screens/main/widget/item_drawer.dart';
import 'package:qrcode_app/screens/myqr/screen_myqr.dart';
import 'package:qrcode_app/screens/result/screen_result.dart';
import 'package:qrcode_app/screens/setting/screen_setting.dart';

import '../../constants.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = '/';

  @override
  MainState createState() => MainState();
}

class MainState extends State<MainScreen> {
  int FRAGMENT_MAIN = 1;
  int FRAGMENT_FAVORITE = 2;
  int FRAGMENT_HISTORY = 3;
  int FRAGMEMT_MYQR = 4;
  int FRAGMENT_CREATEQR = 5;
  int FRAGMENT_SETTING = 6;
  int FRAGMENT_RESULT = 7;

  QRViewController controller;
  bool flash = false;
  int result = 0;
  int status = 1;

  QRCode resultCode = QRCode();

  _getDrawerFragment() {
    switch (status) {
      case 1:
        return MainFragment(
          resultCode1: (result) {
            setState(() {
              resultCode = result;
              status = 7;
            });
          },
        );
      case 2:
        return FavoriteScreen();
      case 3:
        return HistoryScreen();
      case 4:
        return MyQRScreen();
      case 5:
        return CreateScreen();
      case 6:
        return SettingScreen();
      case 7:
        return ResultScreen(code: resultCode);
      default:
        return new Text("Error");
    }
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  }

  void _selectItemMainMenu(int option) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: status == 1 ? true : false,
        appBar: AppBar(
            title: status == FRAGMENT_MAIN
                ? Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    itemAction(true, Icons.image, 20.0, () {
                      getImage();
                    }),
                    itemAction(
                        true, flash ? Icons.flash_on : Icons.flash_off, 20.0,
                        () async {
                      // await controller.toggleFlash();
                      setState(() {
                        flash = !flash;
                      });
                    }),
                    itemAction(true, Icons.autorenew, 20.0, () async {
                      // await controller.flipCamera();
                    })
                  ])
                : status == FRAGMENT_FAVORITE
                    ? Text("Yeu thich")
                    : status == FRAGMENT_HISTORY
                        ? Text("Lich su")
                        : (status == FRAGMEMT_MYQR ||
                                status == FRAGMENT_CREATEQR)
                            ? Text("Tạo")
                            : (status == FRAGMENT_RESULT)
                                ? Text("Quét")
                                : status == FRAGMENT_SETTING
                                    ? Text("Cài đặt")
                                    : Text(""),
            centerTitle: true,
            actions: [
              itemAction(status == FRAGMENT_CREATEQR ? true : false,
                  Icons.person_outline, 10.0, () {}),
              itemAction(status == FRAGMEMT_MYQR ? true : false, Icons.check,
                  10.0, () {}),
              itemAction(status == FRAGMENT_FAVORITE ? true : false, Icons.sort,
                  10.0, () {}),
              status == FRAGMENT_HISTORY ||
                      status == FRAGMENT_FAVORITE ||
                      status == FRAGMEMT_MYQR ||
                      status == FRAGMENT_CREATEQR
                  ? (status == FRAGMENT_HISTORY || status == FRAGMENT_FAVORITE
                      ? Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: PopupMenuButton(
                              child: Icon(Icons.more_vert),
                              onSelected: (value) {
                                _selectItemMainMenu(value);
                              },
                              iconSize: 4,
                              // child: Center(child: Text('click here')),
                              itemBuilder: (context) => [
                                    PopupMenuItem(
                                        value: 1,
                                        child: Icon(Icons.restore_from_trash,
                                            color: Colors.red)),
                                    PopupMenuItem(
                                        value: 2,
                                        child: Icon(
                                            Icons.format_indent_increase,
                                            color: Colors.red)),
                                    PopupMenuItem(
                                        value: 3,
                                        child: Icon(
                                            Icons.format_indent_decrease,
                                            color: Colors.red)),
                                    PopupMenuItem(
                                        value: 4,
                                        child: Icon(
                                            Icons.format_indent_decrease_sharp,
                                            color: Colors.red)),
                                  ]))
                      : Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: PopupMenuButton(
                              child: Icon(Icons.more_vert),
                              onSelected: (value) {
                                _selectItemMainMenu(value);
                              },
                              iconSize: 4,
                              //  child: Center(child: Text('click here')),
                              itemBuilder: (context) => [
                                    PopupMenuItem(
                                        value: 1,
                                        child: Icon(
                                          Icons.restore_from_trash,
                                          color: Colors.red,
                                        )),
                                    PopupMenuItem(
                                        value: 2,
                                        child: Icon(
                                            Icons.format_indent_decrease,
                                            color: Colors.red)),
                                    PopupMenuItem(
                                        value: 3,
                                        child: Icon(
                                            Icons.format_indent_decrease,
                                            color: Colors.red)),
                                    PopupMenuItem(
                                        value: 4,
                                        child: Icon(Icons.create_outlined,
                                            color: Colors.red)),
                                  ])))
                  : Text("")
            ]),
        drawer: Drawer(
            child: ListView(
          children: [
            itemDrawer(Icon(Icons.add), status == FRAGMENT_MAIN, "Quet", () {
              setState(() {
                status = FRAGMENT_MAIN;
              });
              Navigator.pop(context);
            }),
            itemDrawer(Icon(Icons.image), false, "Quet hinh anh", () {
              getImage();
              Navigator.pop(context);
            }),
            itemDivider(),
            itemDrawer(
                Icon(Icons.favorite), status == FRAGMENT_FAVORITE, "Yeu thich",
                () {
              setState(() {
                status = FRAGMENT_FAVORITE;
              });
              Navigator.pop(context);
            }),
            itemDivider(),
            itemDrawer(
                Icon(Icons.history), status == FRAGMENT_HISTORY, "Lich su", () {
              setState(() {
                status = FRAGMENT_HISTORY;
              });
              Navigator.pop(context);
            }),
            itemDivider(),
            itemDrawer(
                Icon(Icons.qr_code), status == FRAGMEMT_MYQR, "QR cua toi", () {
              setState(() {
                status = FRAGMEMT_MYQR;
              });
              Navigator.pop(context);
            }),
            itemDivider(),
            itemDrawer(
                Icon(Icons.create), status == FRAGMENT_CREATEQR, "Tao QR", () {
              setState(() {
                status = FRAGMENT_CREATEQR;
              });
              Navigator.pop(context);
            }),
            itemDivider(),
            itemDrawer(Icon(Icons.settings), false, "Cai dat", () {
              setState(() {
                status = FRAGMENT_SETTING;
              });
              Navigator.pop(context);
            }),
            itemDivider(),
            itemDrawer(Icon(Icons.share), false, "Chia se", () {
              Navigator.pop(context);
            }),
            itemDivider(),
            itemDrawer(Icon(Icons.add), false, "Ung dung cua chung toi", () {
              Navigator.pop(context);
            }),
            itemDivider(),
            itemDrawer(Icon(Icons.add), false, "Loai bo quang cao", () {
              Navigator.pop(context);
            }),
          ],
        )),
        body: _getDrawerFragment());
  }

  Future getImage() async {
    File _image;
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
}

class MainFragment extends StatefulWidget {
  QRCode callback;
  Function(QRCode) resultCode1;

  MainFragment({this.resultCode1});

  // MainFragment(this.callback);

  @override
  MainFragmentState createState() => MainFragmentState();
}

class MainFragmentState extends State<MainFragment> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode result;
  QRViewController controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.resumeCamera();
    } else if (Platform.isIOS) {
      controller.pauseCamera();
    }
  }

  @override
  void dispose() {
    super.dispose();
    DatabaseProvider.instance.close();
  }

  @override
  Widget build(BuildContext context) {
    void _onQRCreateView(QRViewController controller) {
      this.controller = controller;
      controller.scannedDataStream.listen((event) {
        print("scannedDataStream " + event.code);
        // Navigator.push(context,  MaterialPageRoute(builder: (context) => ResultScreen(),));
        setState(() {
          String formattedDate =
              new DateFormat('dd-MM-yyyy kk:mm:ss').format(DateTime.now());

          QRCode qrCode = QRCode(
              id: 1,
              type: 2,
              title: "My Code",
              time: formattedDate,
              content: event.code,
              isFavorite: false);

          DatabaseProvider.db.insert(qrCode).then((storeQr) => {});

          widget.resultCode1(qrCode);
        });
        // widget.callback(null);
        // Navigator.of(context).pushNamed(ResultScreen.routeName, arguments: event);
      });
    }

    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Stack(
            children: [
              Expanded(
                  flex: 1,
                  child: QRView(
                      overlay: QrScannerOverlayShape(
                          borderRadius: 10,
                          borderColor: Colors.red,
                          borderLength: 30,
                          borderWidth: 10,
                          cutOutSize: 300),
                      key: qrKey,
                      onQRViewCreated: _onQRCreateView)),
            ],
          ),
        ),
      ),
    );
  }
}
