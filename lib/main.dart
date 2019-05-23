import 'package:flutter/material.dart';
// import './demo/listview_demo.dart';
// import './demo/drawer_demo.dart';
// import './demo/bottom_navigation_bar_demo.dart';
// import './demo/basic_demo.dart';
// import './demo/layout_demo.dart';
// import './demo/sliver_demo.dart';
import './demo/navigator_demo.dart';
import 'demo/navbar_appbar_demo.dart';
import 'demo/navigator_demo1.dart';
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
      // home: NavigatorDemo(),
      // 路由方式展示页面
      // initialRoute: '/',
//      initialRoute: '/about',
      initialRoute: '/',
      routes: {
//         '/':(context) => NavigatorDemo(),
//        '/':(context) => NavigatorDemo1(s),
        '/about1':(context) => Page1(title: 'About1'),
        '/about':(context) => Page(title: 'About',)
      },
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