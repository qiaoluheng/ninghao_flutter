import 'package:flutter/material.dart';

class BasicDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      // color: Colors.grey[100],
      decoration: BoxDecoration(
          image: DecorationImage( 
              image: AssetImage('assets/images/1.png'),
              alignment: Alignment.topCenter,
              // repeat: ImageRepeat.repeatY,
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.indigoAccent[400].withOpacity(0.5),
                  BlendMode.hardLight))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              child: Icon(Icons.pool, size: 32.0, color: Colors.white),
              // color: Color.fromRGBO(3, 54, 255, 1.0),
              // padding: EdgeInsets.only(left: 24.0, right: 8.0,),
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.all(8.0),
              width: 90.0,
              height: 90.0,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(3, 54, 255, 1.0),
                  // 单个边框设置
                  // border: Border(
                  //   top: BorderSide(
                  //     color: Colors.indigoAccent[100],
                  //     width: 3.0,
                  //     style: BorderStyle.solid,
                  //   )
                  // 设置所有边框
                  border: Border.all(
                    color: Colors.indigoAccent[100],
                    width: 3.0,
                    style: BorderStyle.solid,
                  ),
                  // borderRadius: BorderRadius.circular(16.0),
                  // 也可以单个设置切圆角
                  // borderRadius: BorderRadius.only(
                  //   topLeft: Radius.circular(45.0),
                  //   bottomLeft: Radius.circular(45.0)),
                  // ),
                  // 此属性用来改变盒子形状（切圆形）,注意此属性为 circle 时候不能在设置 borderRadius
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      // 偏移量 x轴偏移，y轴偏移
                      offset: Offset(6.0, 7.0),
                      color: Color.fromRGBO(16, 20, 188, 1.0),
                      // 模糊值，值越大模糊越明显
                      blurRadius: 3.0,
                      // 阴影扩散程度
                      spreadRadius: -3.0,
                    ),
                  ],
                  // 添加渐变效果，径向渐变
                  // gradient: RadialGradient(
                  //   colors: [
                  //     Color.fromRGBO(7, 102, 255, 1.0),
                  //     Color.fromRGBO(3, 28, 128, 1.0)
                  //     ]
                  // ),
                  // 线性渐变
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(7, 102, 255, 1.0),
                      Color.fromRGBO(3, 28, 128, 1.0)
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ))),
        ],
      ),
    );
  }
}

// 多个 Text
class RichTextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: 'yiyuhengxin',
          style: TextStyle(
              color: Colors.deepPurpleAccent,
              fontSize: 34.0,
              // 斜体
              fontStyle: FontStyle.italic,
              // 字体粗细
              fontWeight: FontWeight.w100),
          children: [
            TextSpan(
              text: '.com',
              style: TextStyle(
                fontSize: 17.0,
                color: Colors.grey,
              ),
            )
          ]),
    );
  }
}

class TextDemo extends StatelessWidget {
  final TextStyle _textStyle = TextStyle(
    fontSize: 16.0,
  );
  final String _firstName = 'qiao';
  final String _lastName = 'luheng';
  @override
  Widget build(BuildContext context) {
    return Text(
      '<$_firstName:say>\nHELLO...HELLO...HELLO...\nHELLO...HELLO...HELLO<$_lastName>,World,World,World,World,World,World,World,World,World',
      textAlign: TextAlign.left,
      // _textStyle 表示在类里面私有
      style: _textStyle,
      // 显示最大行数 超过将隐藏
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}
