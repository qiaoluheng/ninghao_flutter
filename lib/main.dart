import 'package:flutter/material.dart';
import './demo/listview_demo.dart';
import './demo/drawer_demo.dart';
import './demo/bottom_navigation_bar_demo.dart';
import './demo/basic_demo.dart';
import './demo/layout_demo.dart';
import './demo/sliver_demo.dart';
// void main() {
//   runApp(
//     App()
//   );
// }
// 胖箭头函数形式
void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 右上角 DEBUG 是否显示
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        // 设置整体高亮背景颜色
        highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
        // 设置整体按钮按下水波纹背景颜色
        splashColor: Colors.white70
        ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Navbar(),
    );
  }

  
}


class Navbar extends StatelessWidget {

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        // 标题左边
        // leading: IconButton(
        //   icon: Icon(Icons.menu),
        //   // 说明按钮的作用
        //   tooltip: 'Navigation',
        //   // 此处为事件
        //   onPressed: () => debugPrint('Navigation button is pressed.'),

        // ),
        title: Text('NINGHAO'),
        // 标题的右半部分
        actions:<Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: () => debugPrint('Search button is pressed.'),
            ),
            IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () => debugPrint('more ... is pressed.'),
              highlightColor: Colors.blue,
            )
        ],
        // 设置导航栏阴影
        elevation: 10.0,
        bottom: TabBar(
          // 未选中的颜色
          unselectedLabelColor: Colors.black38,
          // 指示器颜色(滑条颜色)
          indicatorColor: Colors.black54,
          indicatorSize: TabBarIndicatorSize.label,
          // 指示器宽度
          indicatorWeight: 1.0,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.local_florist)),
            Tab(icon: Icon(Icons.change_history)),
            Tab(icon: Icon(Icons.directions_bike)),
            Tab(icon: Icon(Icons.view_quilt)),
          ],
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          ListViewDemo(),
          BasicDemo(),
          LayoutDemo(),
          SliverDemo(),
          // Icon(Icons.local_florist,size: 128.0, color: Colors.black12),
          // Icon(Icons.change_history,size: 128.0, color: Colors.black12),
          // Icon(Icons.directions_bike,size: 128.0, color: Colors.black12),
        ],
      ),
      // 设置抽屉视图 endDrawer 是从右边划出视图
      drawer: DrawerDemo(),
      bottomNavigationBar: BottomNavigationBarDemo()
    );
  }
}
