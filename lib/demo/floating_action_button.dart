import 'package:flutter/material.dart';

class FloatingActionButtonDemo extends StatelessWidget {
  // 浮动按钮（小图标的）
  final Widget _floatingActionButton = FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.add),
    elevation: 0.0,
    backgroundColor: Colors.black87,
    // 设置形状  ，BeveledRectangleBorder直线切边,切正方形
    // shape: BeveledRectangleBorder(
    //   borderRadius: BorderRadius.circular(30.0)
    // ),
  );

  // 浮动按钮小图标带文字的
  final Widget _floatingActionButtonExtended = FloatingActionButton.extended(
    onPressed: () {},
    icon: Icon(Icons.add),
    label: Text('Add'),
  );

  @override
  Widget build(BuildContext content) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FloatingActionButtonDemo'),
        elevation: 10.0,
      ),
      floatingActionButton: _floatingActionButton,
      // 设置浮动按钮位置
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // 底部工具栏
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 80.0,
        ),
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}