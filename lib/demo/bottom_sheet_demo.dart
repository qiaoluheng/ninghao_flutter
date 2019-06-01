import 'package:flutter/material.dart';
import 'dart:async';



// 底部滑动窗口
class BottomSheetDemo extends StatefulWidget {
  @override
  _BottomSheetDemoState createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {
  final _bottomSheetScaffoldKey = GlobalKey<ScaffoldState>();

  // 打开底部BottomSheet 
  _openBottomSheet() {
    _bottomSheetScaffoldKey.currentState
        .showBottomSheet((BuildContext context) {
      return BottomAppBar(
        child: Container(
          height: 90.0,
          width: double.infinity,
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Icon(Icons.pause_circle_outline),
              SizedBox(
                width: 16.0,
              ),
              Text('01:30 / 03:30'),
              Expanded(
                child: Text('Fix you - Coldplay', textAlign: TextAlign.right),
              ),
            ],
          ),
        ),
      );
    });
  }

  // 底部 模态 选择视图 
  Future _openModalBottomSheet() async {
   final sheetValue = await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200.0,
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text('Option A'),
                onTap: () {
                  Navigator.pop(context,'A');
                },
              ),
              ListTile(
                title: Text('Option B'),
                onTap: () {
                  Navigator.pop(context,'B');
                },
              ),
              ListTile(
                title: Text('Option C'),
                onTap: () {
                  Navigator.pop(context,'C');
                },
              ),
            ],
          ),
        );
      }
    );

    print(sheetValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _bottomSheetScaffoldKey,
      appBar: AppBar(
        title: Text('BottomsheetDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  onPressed: _openBottomSheet,
                  child: Text('Open BottomSheet'),
                ),
                FlatButton(
                  onPressed: _openModalBottomSheet,
                  child: Text('Modal BottomSheet'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
