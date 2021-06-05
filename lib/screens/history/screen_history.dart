import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qrcode_app/db/database_provider.dart';
import 'package:qrcode_app/model/qrcode.dart';
import 'package:qrcode_app/screens/favorite/widget/item_end_drawer.dart';

class HistoryScreen extends StatefulWidget {
  HistoryScreen({Key key}) : super(key: key);

  @override
  HistoryState createState() => HistoryState();
}

GlobalKey<HistoryState> globalKeyHistory = GlobalKey();

class HistoryState extends State<HistoryScreen> {
  List<QRCode> _items = List<QRCode>();

  List<int> actions = List<int>();

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    DatabaseProvider.instance.getQR().then((value) => () {
          print("FavoriteState: " + _items.length.toString());
          _items = value;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        //body: ,
        endDrawer: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width * 0.7,
          child: Drawer(
            child: ListView(
              children: [
                itemEndDrawer(Icon(Icons.link), "Liên kết web",
                    actions.contains(0), () {}),
                itemEndDrawer(
                    Icon(Icons.link), "Văn bản", actions.contains(1), () {}),
                itemEndDrawer(
                    Icon(Icons.link), "Wifi", actions.contains(0), () {}),
                itemEndDrawer(
                    Icon(Icons.link), "Sản phẩm", actions.contains(0), () {}),
                itemEndDrawer(
                    Icon(Icons.link), "Mã vạch", actions.contains(0), () {}),
                itemEndDrawer(
                    Icon(Icons.link), "Điện thoại", actions.contains(0), () {}),
                itemEndDrawer(
                    Icon(Icons.link), "Liên hệ", actions.contains(0), () {}),
                itemEndDrawer(
                    Icon(Icons.link), "ISBN", actions.contains(0), () {}),
                itemEndDrawer(
                    Icon(Icons.link), "Email", actions.contains(0), () {}),
                itemEndDrawer(
                    Icon(Icons.link), "SMS", actions.contains(0), () {}),
                itemEndDrawer(
                    Icon(Icons.link), "Email", actions.contains(0), () {}),
                itemEndDrawer(
                    Icon(Icons.link), "Email", actions.contains(0), () {})
              ],
            ),
          ),
        ));
  }

  void openDrawer() {
    scaffoldKey.currentState.openEndDrawer();
  }
}
