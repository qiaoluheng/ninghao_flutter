import 'package:flutter/material.dart';

class SliderDemo extends StatefulWidget {
  @override
  _SliderDemoState createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {
  double _sliderItemA = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SliderDemo'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row( 
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Slider value: ${_sliderItemA.toStringAsFixed(2)}'),
                Slider(
                  value: _sliderItemA,
                  onChanged: (value) {
                    setState(() {
                      _sliderItemA = value;
                    });
                   },
                   activeColor: Theme.of(context).accentColor,
                   inactiveColor: Theme.of(context).accentColor.withOpacity(0.3),
                    // 设置最大值和最小值  
                   min: 0.0,
                   max: 10.0,
                    // 分隔份数 
                   divisions: 10,
                    // 拖动时候显示的值
                    label: '${_sliderItemA.toInt()}',  
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}