import 'package:flutter/material.dart';
import '../model/post.dart';


class ListViewDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: posts.length,
        itemBuilder: _listItemBuilder,
    );
  }


  Widget _listItemBuilder(BuildContext content, int index) {
    return Container(
      color: Colors.black38,
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Image.network(
            posts[index].imageUrl,
            // 不给 width 值，width 就会根据height自动缩放
            height: 300,
          ),
          SizedBox(height: 12.0),
          Text(
            posts[index].title,
            // 文字主题
            style: Theme.of(content).textTheme.title,
          ),
          Text(
            posts[index].author,
            // 文字主题
            style: Theme.of(content).textTheme.subhead,
          ),
          SizedBox(height: 16.0)
        ],
      ),
    );
  }
}