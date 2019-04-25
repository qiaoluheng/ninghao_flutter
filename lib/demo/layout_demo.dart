import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // Row 是横排，Column 是竖排
      child: Column(
        // 设置主轴对齐方式,spaceEvenly平均分配，spaceBetween沾顶部和顶部均分,spaceAround每个占的上下空间一样
        mainAxisAlignment: MainAxisAlignment.center,
        // 设置交叉轴对齐方式（主轴的垂直方向）默认是居中center
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[ConstrainedBoxDemo()],
      ),
    );
  }
}

// 设置带限制的盒子
class ConstrainedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 200.0, maxWidth: 200.0),
      child: Container(
        color: Color.fromRGBO(3, 54, 255, 1.0),
      ),
    );
  }
}

// 设置子部件的宽高比
class AspectRatioDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      // 设置宽高比
      aspectRatio: 3.0 / 2.0,
      child: Container(
        color: Color.fromRGBO(3, 54, 255, 1.0),
      ),
    );
  }
}

// stack 中存放一摞小部件
class StackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: <Widget>[
        Stack(
          alignment: Alignment.topRight,
          children: <Widget>[
            SizedBox(
              width: 200.0,
              height: 300.0,
              child: Container(
                alignment: Alignment(0.0, -0.9),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(3, 54, 255, 1.0),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                // child: Icon(Icons.ac_unit,color: Colors.white, size: 32.0),
              ),
            ),
            SizedBox(
              height: 32.0,
            ),
            SizedBox(
              width: 100.0,
              height: 100.0,
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(3, 54, 255, 1.0),
                    // borderRadius: BorderRadius.circular(8.0),
                    // 添加渐变
                    shape: BoxShape.circle,
                    gradient: RadialGradient(colors: [
                      Color.fromRGBO(7, 102, 255, 1.0),
                      Color.fromRGBO(3, 54, 255, 1.0)
                    ])),
                child:
                    Icon(Icons.brightness_2, color: Colors.white, size: 32.0),
              ),
            ),
            // 定位weiget，位置相对于最大的部件
            Positioned(
              right: 20.0,
              top: 120.0,
              child: Icon(Icons.ac_unit, color: Colors.white, size: 20.0),
            ),
            Positioned(
              right: 70.0,
              top: 180.0,
              child: Icon(Icons.ac_unit, color: Colors.white, size: 16.0),
            ),
            Positioned(
              right: 30.0,
              top: 230.0,
              child: Icon(Icons.ac_unit, color: Colors.white, size: 18.0),
            ),
            Positioned(
              right: 90.0,
              bottom: 20.0,
              child: Icon(Icons.ac_unit, color: Colors.white, size: 16.0),
            ),
            Positioned(
              right: 4.0,
              bottom: -4.0,
              child: Icon(Icons.ac_unit, color: Colors.white, size: 20.0),
            ),
          ],
        )
      ],
    );
  }
}

class SizedBoxDemo extends StatelessWidget {
  final double width;
  final double height;
  final IconData icon;
  SizedBoxDemo(
    this.icon, {
    this.width = 100.0,
    this.height = 50.0,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(3, 54, 255, 1.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Icon(icon, color: Colors.white, size: 32.0),
      ),
    );
  }
}

// 可配置的图标徽章
class Iconbadge extends StatelessWidget {
  final IconData icon;
  final double size;
  // 构造方法
  Iconbadge(this.icon, {this.size = 32.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(icon, size: size, color: Colors.white),
      width: size + 60,
      height: size + 60,
      color: Color.fromRGBO(3, 54, 255, 1.0),
    );
  }
}
