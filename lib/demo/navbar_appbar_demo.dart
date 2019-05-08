import 'package:flutter/material.dart';

import 'basic_demo.dart';
import 'bottom_navigation_bar_demo.dart';
import 'drawer_demo.dart';
import 'layout_demo.dart';
import 'listview_demo.dart';
import 'sliver_demo.dart';

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
