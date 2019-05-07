import 'package:flutter/material.dart';


class BottomNavigationBarDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BottomNavigationBarDemoState();
  }
  
}

class _BottomNavigationBarDemoState extends State<BottomNavigationBarDemo>{

  int _currentIndex = 0;

  void _onTapHandler(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTapHandler,
        // 当 bottomNavigationBar 的items 中元素超过三个自动改变 type 类型，所以需要重新设置一下 type 
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            title: Text('Explore'),
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            title: Text('History'),
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('List'),
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Person'),
            ),
        ],
      );
  }
  
}