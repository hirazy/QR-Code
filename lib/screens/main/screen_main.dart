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
import 'package:qrcode_app/screens/create_detail/screen_create_detail.dart';
import 'package:qrcode_app/screens/faq/screen_faq.dart';
import 'package:qrcode_app/screens/favorite/screen_favorite.dart';
import 'package:qrcode_app/screens/history/screen_history.dart';
import 'package:qrcode_app/screens/main/widget/item_action.dart';
import 'package:qrcode_app/screens/main/widget/item_divider.dart';
import 'package:qrcode_app/screens/main/widget/item_drawer.dart';
import 'package:qrcode_app/screens/myqr/screen_myqr.dart';
import 'package:qrcode_app/screens/result/screen_result.dart';
import 'package:qrcode_app/screens/result_create/screen_result_create.dart';
import 'package:qrcode_app/screens/setting/screen_setting.dart';
import 'package:qrcode_app/utils/SharePreferenceUtils.dart';

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
  int FRAGMENT_RESULT_CREATE = 8;
  int FRAGMENT_CREATE_DETAIL = 9;
  int FRAGMENT_FAQ = 10;

  QRViewController controller;
  bool flash = false;
  int result = 0;
  int status = 1;
  int oldStatus = 1;
  int typeCreate = 1;

  String contentCreate = "";

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
          key: globalKey,
        );
      case 2:
        return FavoriteScreen();
      case 3:
        return HistoryScreen(
          key: globalKeyHistory,
        );
      case 4:
        return MyQRScreen(
            contentCreate: (content) {
              // setState(() {
              setState(() {
                contentCreate = content;
                SharePreferenceUtils.setMyQr(contentCreate);
                typeCreate = 0;
                status = 8;
              });
            },
            key: globalKeyMyQR);
      case 5:
        oldStatus = FRAGMENT_CREATEQR;
        return CreateScreen(typeCreate: (type) {
          setState(() {
            typeCreate = type;
            status = FRAGMENT_CREATE_DETAIL;
          });
        });
      case 6:
        return SettingScreen();
      case 7:
        return ResultScreen(code: resultCode);
      case 8:
        return ResultCreateScreen(type: typeCreate, content: contentCreate);
      case 9:
        return CreateDetailScreen(
            type: typeCreate,
            contentCreate: (content) {
              setState(() {
                contentCreate = content;
                status = 8;
              });
            },
            key: globalKeyCreateDetail);
      case 10:
        return MyStatefulWidget();
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

  void _selectItemMainMenu1(int option) {
    switch (option) {
      case 1:
        if (oldStatus == FRAGMEMT_MYQR) {
          SharePreferenceUtils.setMyQr("");
          setState(() {
            status = FRAGMEMT_MYQR;
          });
        } else {
          setState(() {
            status = FRAGMENT_CREATEQR;
          });
        }
        break;
    }
  }

  void _selectItemMainMenu2(int option) {
    switch (option) {
      case 1:
        if (oldStatus == FRAGMEMT_MYQR) {
          SharePreferenceUtils.setMyQr("");
          setState(() {
            status = FRAGMEMT_MYQR;
          });
        } else {
          setState(() {
            status = FRAGMENT_CREATEQR;
          });
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: Scaffold(
        extendBodyBehindAppBar: status == 1 ? true : false,
        appBar: AppBar(
            title: status == FRAGMENT_MAIN
                ? Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              itemAction(true, Icons.image, 20.0, () {
                getImage();
              }),
              itemAction(
                  true, flash ? Icons.flash_on : Icons.flash_off, 20.0,
                      () {
                    print("flash_on");
                    globalKey.currentState.swipeFlash();
                    DatabaseProvider.instance.getQR().then((value) => () {
                      print(
                          "_getDrawerFragment" + value.length.toString());
                    });

                    setState(() {
                      // MainFragment.globalKey.currentState.swipeFlash();
                      flash = !flash;
                    });

                    // });
                  }),
              itemAction(true, Icons.autorenew, 20.0, () {
                // MainFragment.globalKey.currentState.flipCamera();
                // await controller.flipCamera();
                globalKey.currentState.flipCamera();
              })
            ])
                : status == FRAGMENT_FAVORITE
                ? Text("Yeu thich", style: TextStyle(color: Colors.white))
                : status == FRAGMENT_HISTORY
                ? Text("Lich su", style: TextStyle(color: Colors.white))
                : (status == FRAGMEMT_MYQR ||
                status == FRAGMENT_CREATEQR ||
                status == FRAGMENT_RESULT_CREATE ||
                status == FRAGMENT_CREATE_DETAIL)
                ? Text(
              "Tạo",
              style: TextStyle(color: Colors.white),
            )
                : (status == FRAGMENT_RESULT)
                ? Text("Quét",
                style: TextStyle(color: Colors.white))
                : status == FRAGMENT_SETTING
                ? Text("Cài đặt",
                style: TextStyle(color: Colors.white))
                : Text(""),
            centerTitle: true,
            actions: [
              itemAction(status == FRAGMENT_CREATEQR ? true : false,
                  Icons.person_outline, 10.0, () {}),
              itemAction(
                  status == FRAGMEMT_MYQR || status == FRAGMENT_CREATE_DETAIL
                      ? true
                      : false,
                  Icons.check,
                  10.0, () {
                if (status == FRAGMEMT_MYQR) {
                  globalKeyMyQR.currentState.clickCreate();
                } else {
                  print("clickCreate");
                  globalKeyCreateDetail.currentState.clickCreate();
                }
              }),
              itemAction(
                  status == FRAGMENT_FAVORITE || status == FRAGMENT_HISTORY
                      ? true
                      : false,
                  Icons.sort,
                  10.0, () {
                if (status == FRAGMENT_FAVORITE) {
                } else {
                  globalKeyHistory.currentState.openDrawer();
                }
              }),
              status == FRAGMENT_HISTORY ||
                  status == FRAGMENT_FAVORITE ||
                  status == FRAGMEMT_MYQR ||
                  status == FRAGMENT_CREATEQR ||
                  status == FRAGMENT_RESULT ||
                  status == FRAGMENT_RESULT_CREATE
                  ? (status == FRAGMENT_HISTORY || status == FRAGMENT_FAVORITE
                  ? Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: PopupMenuButton(
                      child: Icon(Icons.more_vert, color: Colors.white),
                      onSelected: (value) {
                        _selectItemMainMenu1(value);
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
                        _selectItemMainMenu2(value);
                      },
                      iconSize: 4,
                      //  child: Center(child: Text('click here')),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                            value: 1,
                            child: Icon(Icons.restore_from_trash,
                                color: Colors.red)),
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
        drawer: Container(
            color: Colors.white,
            child: Drawer(
                child: ListView(
                  children: [
                    Wrap(
                      children: [
                        itemDrawer(
                            Icon(
                              Icons.check_box_outline_blank,
                            ),
                            status == FRAGMENT_MAIN,
                            "Quet", () {
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
                        itemDrawer(Icon(Icons.favorite),
                            status == FRAGMENT_FAVORITE, "Yeu thich", () {
                              setState(() {
                                status = FRAGMENT_FAVORITE;
                              });
                              Navigator.pop(context);
                            }),
                        itemDivider(),
                        itemDrawer(Icon(Icons.history), status == FRAGMENT_HISTORY,
                            "Lich su", () {
                              setState(() {
                                status = FRAGMENT_HISTORY;
                              });
                              Navigator.pop(context);
                            }),
                        itemDivider(),
                        itemDrawer(Icon(Icons.qr_code), status == FRAGMEMT_MYQR,
                            "QR cua toi", () {
                              String myQr = SharePreferenceUtils.getMyQr();
                              contentCreate = myQr;
                              oldStatus = FRAGMEMT_MYQR;
                              print("MyQRScreen: " + oldStatus.toString());

                              setState(() {
                                if (myQr == "") {
                                  status = FRAGMEMT_MYQR;
                                } else {
                                  typeCreate = 0;
                                  status = FRAGMENT_RESULT_CREATE;
                                }
                              });
                              Navigator.pop(context);
                            }),
                        itemDivider(),
                        itemDrawer(Icon(Icons.create), status == FRAGMENT_CREATEQR,
                            "Tao QR", () {
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
                        itemDrawer(
                            Icon(Icons.apps), false, "Ung dung cua chung toi", () {
                          Navigator.pop(context);
                        }),
                        itemDivider(),
                        itemDrawer(
                            Icon(Icons.remove_circle), false, "Loai bo quang cao",
                                () {
                              setState(() {
                                status = FRAGMENT_FAQ;
                              });
                              Navigator.pop(context);
                            }),
                      ],
                    )
                  ],
                ))),
        body: _getDrawerFragment()), onWillPop: _popContext);
  }

  void _popContext(){

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

  MainFragment({this.resultCode1, Key key}) : super(key: key);

  static final GlobalKey<MainFragmentState> globalKey = GlobalKey();

  // MainFragment(this.callback);

  @override
  MainFragmentState createState() => MainFragmentState();
}

GlobalKey<MainFragmentState> globalKey = GlobalKey();

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
    //  DatabaseProvider.instance.close();
  }

  @override
  Widget build(BuildContext context) {
    void _onQRCreateView(QRViewController controller) {
      this.controller = controller;
      controller.scannedDataStream.listen((event) {
        String formattedDate1 =
            new DateFormat('dd-MM-yyyy kk:mm:ss').format(DateTime.now());

        QRCode qrCode1 = QRCode(
            id: 0,
            type: 0,
            title: "My Code",
            time: formattedDate1,
            content: event.code,
            isFavorite: false);

        DatabaseProvider.instance.create(qrCode1);

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

          // DatabaseProvider.db.insert(qrCode).then((storeQr) => {
          //
          // });

          widget.resultCode1(qrCode);

          print("_onQRCreateView DatabaseProvider");

          print("_onQRCreateView DatabaseProvider1");
        });
        print("_onQRCreateView DatabaseProvider2");

        print("_onQRCreateView DatabaseProvider3");
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
                          borderColor: ThemeData().primaryColor,
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

  void swipeFlash() async {
    print("swipeFlash");
    await controller.toggleFlash();
  }

  void flipCamera() async {
    await controller.flipCamera();
  }
}
