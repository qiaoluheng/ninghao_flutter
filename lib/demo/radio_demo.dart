import 'package:flutter/material.dart';

class RadioDemo extends StatefulWidget {
  @override
  _RadioDemoState createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {
  int _radioGroupA = 0;

  void _handleRadioValueChanged(int value) {
    setState(() {
      _radioGroupA = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RadioDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text('RadioGroupValue: $_radioGroupA'),
            SizedBox(height: 32.0,),
            RadioListTile(
              onChanged: _handleRadioValueChanged,
              value: 0,
              groupValue: _radioGroupA,
              title: Text('Options A'),
              subtitle: Text('Description...Options A...'),
              secondary: Icon(Icons.filter_1),
              selected: _radioGroupA == 0,
            ),
            RadioListTile(
              onChanged: _handleRadioValueChanged,
              value: 1,
              groupValue: _radioGroupA,
              title: Text('Options B'),
              subtitle: Text('Description...Options B...'),
              secondary: Icon(Icons.filter_2),
              selected: _radioGroupA == 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BasicRadioDemo(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BasicRadioDemo extends StatefulWidget {
  @override
  _BasicRadioDemoState createState() => _BasicRadioDemoState();
}

class _BasicRadioDemoState extends State<BasicRadioDemo> {
  int _radioGroupValueA = 0;

  void _handleRadoiChange(int value) {
    setState(() {
      _radioGroupValueA = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Radio(
            value: 0,
            groupValue: _radioGroupValueA,
            activeColor: Colors.orange,
            onChanged: _handleRadoiChange,
          ),
          Radio(
            value: 1,
            groupValue: _radioGroupValueA,
            activeColor: Colors.orange,
            onChanged: _handleRadoiChange,
          ),
        ],
      ),
    );
  }
}
