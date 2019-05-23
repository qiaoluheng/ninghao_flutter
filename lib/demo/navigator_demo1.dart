import 'package:flutter/material.dart';

class NavigatorDemo1 extends StatelessWidget {
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
              onPressed: (){
//                Navigator.of(context).push(
//                  MaterialPageRoute(
//                      builder: (BuildContext context) => Page1(title:'About1'),
//                  ),
//                );
              Navigator.pushNamed(context, '/about1');
              },
            )
          ],
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  final String title;

  Page1({
    this.title
  });
  @override
  Widget build(BuildContext content){
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
          // 设置导航栏阴影
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: (){
          Navigator.pop(content);
        },
      ),
    );
  }

}
