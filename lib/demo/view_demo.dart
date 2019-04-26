import 'package:flutter/material.dart';
import '../model/post.dart';


// 页面视图和网格视图
class ViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridViewBuilderDemo();
  }
}

// GridView.builder 根据数据构建网格视图
class GridViewBuilderDemo extends StatelessWidget {
  Widget _gridItemBuilder(BuildContext context, int index) {
    return Container(
      child: Image.network(
        posts[index].imageUrl,
        fit:BoxFit.cover
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(8.0),
      itemCount: posts.length,
      itemBuilder: _gridItemBuilder,
      // 设置代理方法,此方法主要设置个数
      // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //   // 交叉轴上视图个数
      //   crossAxisCount: 4,
      //   crossAxisSpacing: 8.0,
      //   mainAxisSpacing: 8.0,
      // ),
      // 设置代理方法,此方法主要设置最大个数
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 150.0,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
    );
  }
}

// GridView.Extent 创建网格视图
class GridViewExtentDemo extends StatelessWidget {
  List<Widget> _buildTiles(int length) {
    return List.generate(length, (int index) {
      return Container(
        color: Colors.grey[300],
        alignment: Alignment(0.0, 0.0),
        child: Text('Item $index',
            style: TextStyle(fontSize: 18.0, color: Colors.grey)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      // 网格在交叉轴上最大的尺寸
      maxCrossAxisExtent: 100.0,
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 16.0,
      // 设置滚动方向
      // scrollDirection: Axis.horizontal,
      children: _buildTiles(100),
    );
  }
}

// GridView.count 创建网格视图
class GridViewCountDemo extends StatelessWidget {
  List<Widget> _buildTiles(int length) {
    return List.generate(length, (int index) {
      return Container(
        color: Colors.grey[300],
        alignment: Alignment(0.0, 0.0),
        child: Text('Item $index',
            style: TextStyle(fontSize: 18.0, color: Colors.grey)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 16.0,
      // 设置滚动方向
      scrollDirection: Axis.horizontal,
      children: _buildTiles(100),
    );
  }
}

// PageBuilder 创建页面视图
class PageViewBuilderDemo extends StatelessWidget {
  Widget _pageItemBuilder(BuildContext context, int index) {
    return Stack(
      children: <Widget>[
        // SizedBox.expand 占满所有空间
        SizedBox.expand(
          child: Image.network(
            posts[index].imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          child: Column(
            // 对齐方式
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(posts[index].title,
                  style: TextStyle(
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red)),
              Text(posts[index].author),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: posts.length,
      itemBuilder: _pageItemBuilder,
    );
  }
}

// PageView 页面视图创建，滚动视图
class PageViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      // 整页滚动，默认为true
      // pageSnapping: false,
      // 倒置页面，首页变最后页面，最后变首页
      // reverse: true,
      // 设置滚动方向 (垂直滚动)
      // scrollDirection: Axis.vertical,
      // 页面在可视口中间显示时候的回调函数
      onPageChanged: (currentPage) => debugPrint('Page: $currentPage'),
      controller: PageController(
        // 初始页面 index
        initialPage: 1,
        // 是否记忆当前页面,默认是true
        keepPage: false,
        // 默认视口占用比例
        viewportFraction: 0.85,
      ),
      children: <Widget>[
        Container(
          color: Colors.brown[900],
          // 设置子部件的对齐方式  （居中）
          alignment: Alignment(0.0, 0.0),
          child: Text('ONE',
              style: TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
        Container(
          color: Colors.grey[900],
          // 设置子部件的对齐方式  （居中）
          alignment: Alignment(0.0, 0.0),
          child: Text('TWO',
              style: TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
        Container(
          color: Colors.orange[900],
          // 设置子部件的对齐方式  （居中）
          alignment: Alignment(0.0, 0.0),
          child: Text('THREE',
              style: TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
      ],
    );
  }
}
