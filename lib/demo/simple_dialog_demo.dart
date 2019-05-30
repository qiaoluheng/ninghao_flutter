import 'package:flutter/material.dart';
import 'dart:async';

enum Option { A, B, C }

enum AlertAction {
  Ok,Cancel
}

class SimpleDialogDemo extends StatefulWidget {
  @override
  _SimpleDialogDemoState createState() => _SimpleDialogDemoState();
}

class _SimpleDialogDemoState extends State<SimpleDialogDemo> {
  String _choice = 'Nothing';

  // 打开 SimpleDialog 弹出框 
  Future _openSimpleDialog() async {
    final option = await showDialog(
        context: context,
        // barrierDismissible: false,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text('SimpleDialog'),
            children: <Widget>[
              SimpleDialogOption(
                child: Text('Option A'),
                onPressed: () {
                  Navigator.pop(context, Option.A);
                },
              ),
              SimpleDialogOption(
                child: Text('Option B'),
                onPressed: () {
                  Navigator.pop(context, Option.B);
                },
              ),
              SimpleDialogOption(
                child: Text('Option C'),
                onPressed: () {
                  Navigator.pop(context, Option.C);
                },
              ),
              Container(
                width: 160.0,
                height: 30.0,
                child: OutlineButton.icon(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  label: Text('关闭'),
                ),
              )
            ],
          );
        });

    switch (option) {
      case Option.A:
        setState(() {
          _choice = "abc";
        });
        break;
      case Option.B:
        setState(() {
          _choice = "bcd";
        });
        break;
      case Option.C:
        setState(() {
          _choice = "cde";
        });
        break;
      default:
        setState(() {
          _choice = 'not select';
        });
    }
  }

  String _choiceAlert = 'Nothing';
  // 打开 AlertDialog 弹出框
  Future _openAlertDialog() async {
   final action = await showDialog(
      context: context,
      // 点击阴影是否关闭，true关闭，false 不关闭
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
           title: Text('AlertDialog'),
           content: Text('确定此操作吗 ?'),
           // 添加动作  
           actions: <Widget>[
             FlatButton(
               child: Text('取消'),
               onPressed: () {
                 Navigator.pop(context, AlertAction.Cancel);
               },
             ),
             FlatButton(
               child: Text('确定'),
               onPressed: () {
                 Navigator.pop(context, AlertAction.Ok);
               },
             ),
           ],
        );
      },
    );
  
    switch (action) {
      case AlertAction.Cancel:
        setState(() {
          _choiceAlert = 'Cancel';
        });
        break;
      case AlertAction.Ok:
        setState(() {
          _choiceAlert = 'Ok';
        });
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SimpleDialogDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('AlertDialog value: ${_choiceAlert}'),
            SizedBox(height:20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // 打开 Alert 按钮
                RaisedButton(
                  onPressed: _openAlertDialog,
                  child: Text('Open AlertDialog'),
                ),
              ],
            ),
            SizedBox(
              height: 300.0,
            ),
            Text('SimpleDialog Select value: ${_choice}'),
          ],
        ),
      ),
      // 打开 SimpleDialog 按钮
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.format_list_numbered),
        onPressed: _openSimpleDialog,
      ),
    );
  }
}
