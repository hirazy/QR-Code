import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qrcode_app/constants.dart';
import 'package:qrcode_app/db/database_provider.dart';
import 'package:qrcode_app/model/qrcode.dart';
import 'package:qrcode_app/widgets/card_item_code.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  FavoriteState createState() => FavoriteState();
}

class FavoriteState extends State<FavoriteScreen> {
  List<QRCode> _items;

  @override
  void initState() {
    super.initState();
    DatabaseProvider.instance.getQR().then((value) => _items = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemBuilder: (context, index) {
        return ReorderableListView(
          onReorder: onReorder,
          children: _getListItems(),
        );
      }),
    );
  }

  List<Widget> _getListItems() => _items
      .asMap()
      .map((i, item) => MapEntry(i, _buildTenableListTile(item, i)))
      .values
      .toList();

  Widget _buildTenableListTile(QRCode item, int index) {
    return Dismissible(
      key: Key(item.id.toString()),
      onDismissed: (direction) {
        setState(() {
          _items.removeAt(index);
        });
      },
      background: Container(color: Colors.red),
      child: cardItemQR(item, TYPE_FAVORITE, () {

      }, (value) {

      }, () {

      }),
      // child: InkWell(
      //   child:
      //   key: ValueKey(item.id),
      //   leading: ,
      //   title: Text(
      //     '${item.sequence}. ${item.name}',
      //     style: TextStyle(
      //       color: Colors.black,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      //   subtitle: Text(
      //     '${item.artist} ${item.songId}',
      //     style: TextStyle(
      //       color: Colors.black,
      //     ),
      //   ),
    );
  }

  void onReorder(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }

    setState(() {
      QRCode qrCode = _items[oldIndex];
      _items.removeAt(oldIndex);
      _items.insert(newIndex, qrCode);
    });
  }
}
