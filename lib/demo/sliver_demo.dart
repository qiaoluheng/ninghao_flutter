import 'package:flutter/material.dart';
import '../model/post.dart';

class SliverDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          // 添加SliverAppBar
          SliverAppBar(
            // title: Text('NINGHAO'),
            // AppBar 是否固定到顶部
            // pinned: true,
            floating: true,
            // 设置伸展高度
            expandedHeight: 178.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Ninghao Flutter'.toUpperCase(),
                style: TextStyle(
                  fontSize: 15.0,
                  // 添加字间距
                  letterSpacing: 3.0,
                  // 设置字体粗细
                  fontWeight: FontWeight.w400
                  )
              ),
              background: Image.network(
                'http://img.pconline.com.cn/images/upload/upc/tx/itbbs/1409/11/c9/38468199_1410412930091.jpg',
                fit: BoxFit.cover,),
            ),
          ),
          // 添加padding 的sliver
           SliverPadding(
             padding: EdgeInsets.all(8.0),
             sliver: SliverGridDemo(),
           ),
          SliverSafeArea(
            sliver: SliverPadding(
              padding: EdgeInsets.all(8.0),
              sliver: SliverListDemo(),
            ),
          ),
        
        ],
      ),
    );
  }
}

// Sliver 列表视图
class SliverListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext content, int index) {
        return Padding(
            padding: EdgeInsets.only(bottom: 32.0),
            child: Material(
              borderRadius: BorderRadius.circular(12.0),
              // 设置阴影
              elevation: 14.0,
              // 设置阴影颜色
              shadowColor: Colors.red.withOpacity(0.5),
              // child: ContainerImageNetworkDemo(index: index),
              child: StackImageBlockDemo(index: index,),
            ),
            );
      }, childCount: posts.length),
    );
  }
}

// Stack 添加多个Weiget
class StackImageBlockDemo extends StatelessWidget{

  final int index;

  const StackImageBlockDemo({Key key, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatioImageDemo(index: index,),
        // 添加定位部件
        Positioned(
          top: 32.0,
          left: 32.0,
          child: Column(
            // 设置交叉轴对齐方式
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(posts[index].title,style: TextStyle(fontSize: 20.0,color: Colors.white),),
              Text(posts[index].author,style: TextStyle(fontSize: 13.0,color: Colors.white),),
            ],
          ),
        ),
      ],
    );
  }
}

// AspectRatio 屏幕宽高比 容器
class AspectRatioImageDemo extends StatelessWidget {
  final int index;
  const AspectRatioImageDemo({Key key, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16.0/9.0,
      child: Image.network(
        posts[index].imageUrl,
        fit:BoxFit.cover,
      ),
    );
  }
}

// Container 容器存放Image.network
class ContainerImageNetworkDemo extends StatelessWidget{

  ContainerImageNetworkDemo({Key key,this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(
        posts[index].imageUrl,
      ),
    );
  }

  
}

// Sliver 网格视图
class SliverGridDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        // 控制网格显示的宽高比例
        childAspectRatio: 1.6,
      ),
      delegate: SliverChildBuilderDelegate((BuildContext content, int index) {
        return Container(
          child: Image.network(
            posts[index].imageUrl,
            fit: BoxFit.cover,
          ),
          //  padding: EdgeInsets.all(20.0),
        );
      }, childCount: posts.length),
    );
  }
}
