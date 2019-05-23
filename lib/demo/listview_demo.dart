import 'package:flutter/material.dart';
import '../model/post.dart';
import './post_show.dart';
class ListViewDemo extends StatelessWidget {
  Widget _listItemBuilder(BuildContext content, int index) {
    return Container(
      color: Colors.black38,
      margin: EdgeInsets.all(8.0),
      child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                // 设置图片固定比例
                AspectRatio(
                  aspectRatio: 16/9,
                  child: Image.network(posts[index].imageUrl,fit: BoxFit.cover),
                ),
                SizedBox(height: 16.0),
                Text(
                  posts[index].title,
                  style: Theme.of(content).textTheme.title
                ),
                Text(
                  posts[index].author,
                  style: Theme.of(content).textTheme.subhead
                ),
                SizedBox(height: 16.0),
              ],
            ),
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                // 设置溅墨 动画效果
                child: InkWell(
                  // 设置溅墨颜色s
                  splashColor: Colors.white.withOpacity(0.3),
                  highlightColor: Colors.white.withOpacity(0.1),
                  onTap: (){
                    // debugPrint('Tap');
                    Navigator.of(content).push(
                      MaterialPageRoute(builder: (content) => PostShow(post: posts[index]))
                    );
                  },
                ),
              ),
            ),
          ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: _listItemBuilder,
    );
  }
}

class Colums extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: _listItemBuilder,
    );
  }
}
