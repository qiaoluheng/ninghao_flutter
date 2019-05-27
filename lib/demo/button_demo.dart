import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Widget flatButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          child: Text('Button'),
          onPressed: () {},
          // 设置溅墨效果
          splashColor: Colors.red,
          textColor: Theme.of(context).accentColor,
        ),
        FlatButton.icon(
          label: Text('Button'),
          icon: Icon(Icons.add),
          onPressed: () {},
          // 设置溅墨效果
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
      ],
    );

    final Widget raisedButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // 设置按钮样式 方式二
        Theme(
          // .copyWith 覆盖样式
          data: Theme.of(context).copyWith(
            buttonColor: Theme.of(context).accentColor,
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
              // 斜角矩形样式
              // shape: BeveledRectangleBorder(
              //   borderRadius: BorderRadius.circular(5.0),
              // ),
              shape: StadiumBorder(),
            ),
          ),
          child: RaisedButton(
            child: Text('theme btn'),
            onPressed: () {},
            splashColor: Colors.grey,
            elevation: 0.0,
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        // 设置按钮样式 方式一
        RaisedButton(
          child: Text('Btn'),
          onPressed: () {},
          // 设置溅墨效果
          splashColor: Colors.red,
          elevation: 0.0,
          color: Theme.of(context).accentColor,
          // 设置按钮文字颜色
          // textColor: Colors.white,
          // textTheme: ButtonTextTheme.primary,
        ),
        SizedBox(
          width: 10.0,
        ),
        // RaisedButton
        RaisedButton.icon(
          label: Text('Button'),
          icon: Icon(Icons.add),
          onPressed: () {},
          // 设置溅墨效果
          splashColor: Colors.grey,
          elevation: 12.0,
          textColor: Theme.of(context).accentColor,
        ),
      ],
    );

    // 带边框的按钮
    final Widget outlineButtonDemo = OutlineButton.icon(
      icon: Icon(Icons.add),
      label: Text('OutlineBtn'),
      onPressed: () {},
      splashColor: Colors.grey[400],
      textColor: Colors.black,
      borderSide: BorderSide(
        color: Colors.black26,
      ),
      // 高亮状态边框颜色
      highlightedBorderColor: Colors.grey,
    );

    // 设置固定宽度的按钮，需要放到Container
    final Widget fixedWidthButtonDemo = Container(
      width: 130.0,
      height: 30.0,
      child: OutlineButton(
        child: Text('OutlineBtn'),
        onPressed: () {},
        splashColor: Colors.grey[400],
        textColor: Colors.black,
        borderSide: BorderSide(
          color: Colors.black26,
        ),
        // 高亮状态边框颜色
        highlightedBorderColor: Colors.grey,
      ),
    );

    // 占满可用宽度的按钮
    final Widget expandedButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // 占满可用宽度的按钮
        Expanded(
          child: OutlineButton(
            child: Text('Button'),
            onPressed: () {},
            splashColor: Colors.grey[200],
            borderSide: BorderSide(
              color: Colors.black,
            ),
            textColor: Colors.black,
            highlightedBorderColor: Colors.grey,
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        // 占满可用宽度的按钮
        Expanded(
          flex: 2,
          child: OutlineButton(
            child: Text('Button'),
            onPressed: () {},
            splashColor: Colors.grey[200],
            borderSide: BorderSide(
              color: Colors.black,
            ),
            textColor: Colors.black,
            highlightedBorderColor: Colors.grey,
          ),
        )
      ],
    );
    // 一组带边距的横排显示按钮
    final Widget buttonBarDemo =  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Theme(
                  data: Theme.of(context).copyWith(
                    buttonTheme: ButtonThemeData(
                      // 设置横向和纵向的padding
                      padding: EdgeInsets.symmetric(horizontal: 32.0),
                    ),
                  ),
                  child: ButtonBar(
                  children: <Widget>[
                    OutlineButton(
                      onPressed: () {},
                      child: Text('Button'),
                      splashColor: Colors.black,
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                      textColor: Colors.black,
                      highlightedBorderColor: Colors.grey,
                    ),
                    OutlineButton(
                      onPressed: () {},
                      child: Text('Button'),
                      splashColor: Colors.black,
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                      textColor: Colors.black,
                      highlightedBorderColor: Colors.grey,
                    ),
                  ],
                ),
                ),
              ],
            );

    return Scaffold(
      appBar: AppBar(
        title: Text('ButtonDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            flatButtonDemo,
            raisedButtonDemo,
            outlineButtonDemo,
            fixedWidthButtonDemo,
            expandedButton,
            buttonBarDemo,
          ],
        ),
      ),
    );
  }
}