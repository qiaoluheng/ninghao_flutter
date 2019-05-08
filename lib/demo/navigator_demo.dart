
import 'package:flutter/material.dart'; 
class NavigatorDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text('Home'),
              onPressed: null,
            ),
            FlatButton(
              child: Text('About'),
              onPressed: () {
                // 路由方式一，直接路由界面
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (BuildContext context) => Page(title: 'About'),
                //   ),
                // );
                // 路由方式二，通过名字路由，需要配置routes
                Navigator.pushNamed(context, '/about');
              },
            )
          ],
        ),
        ),
    );
  }
}

class Page extends StatelessWidget {

  final String title;
  // 构造函数
  Page({
    this.title
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        // 设置导航栏阴影
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}