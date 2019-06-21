import 'package:flutter/material.dart';

class AnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationDemo'),
        elevation: 0.0,
      ),
      body: AnimationDemoHome(),
    );
  }
} 

class AnimationDemoHome extends StatefulWidget {
  
  @override
  _AnimationDemoHomeState createState() => _AnimationDemoHomeState();
}

class _AnimationDemoHomeState extends State<AnimationDemoHome> with TickerProviderStateMixin{
  AnimationController animationDemoController;

  Animation animation;
  Animation animationColor;
  CurvedAnimation curve;

  @override
  void initState() { 
    super.initState();
    animationDemoController = AnimationController(
      // // 初始值
      // value: 32.0,
      // // 下边界值
      // lowerBound: 32.0,
      // // 最终值
      // upperBound: 100.0,
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );

    // 设置动画曲线
    curve = CurvedAnimation(parent: animationDemoController, curve: Curves.bounceOut);

    // 设置 Tween
    // animation = Tween(begin: 32.0, end: 100.0).animate(animationDemoController);
    animation = Tween(begin: 32.0, end: 100.0).animate(curve);
    // animationColor = ColorTween(begin: Colors.red, end: Colors.red[900]).animate(animationDemoController);
    animationColor = ColorTween(begin: Colors.red, end: Colors.red[900]).animate(curve);
    
    // 添加动画监听
    // animationDemoController.addListener(() {
    //   // print('${animationDemoController.value}');
    //   // 实时更新动画详情
    //   setState(() {});
    // });
    // 添加动画动态监听
    animationDemoController.addStatusListener((AnimationStatus status) {
      print(status);
    });

    // 执行动画
    // animationDemoController.forward();

  }

  @override
  void dispose() {
    super.dispose();
    // 销毁动画控制器
    animationDemoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimationHeart(
        animations: [
          animation,animationColor
        ],
        controller: animationDemoController,
      ),
    );
  }
}

class AnimationHeart extends AnimatedWidget {
  final List animations;
  final AnimationController controller;

  AnimationHeart({
    this.animations,
    this.controller,
  }) : super(listenable: controller);
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.favorite),
        // iconSize: animationDemoController.value,
        iconSize: animations[0].value,
        color: animations[1].value,
        onPressed: () { 
          // animationDemoController.forward();
          switch (controller.status) {
            case AnimationStatus.completed:
              // 反向执行动画(倒退动画)
              controller.reverse();
              break;
            default :
              controller.forward();
          }
        },
      );
  }

}