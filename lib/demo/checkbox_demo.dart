import 'package:flutter/material.dart';

class CheckboxDemo extends StatefulWidget {
  @override
  _CheckboxDemoState createState() => _CheckboxDemoState();
}

class _CheckboxDemoState extends State<CheckboxDemo> {
  bool _checkboxItemA = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('_CheckboxDemo'),
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CheckboxListTile(
              value: _checkboxItemA,
              onChanged: (value) {
                setState(() {
                  _checkboxItemA = value;
                });
              },
              // 标题
              title: Text('Checkbox Item A'),
              // 子标题
              subtitle: Text('Description ......'),
              secondary: Icon(Icons.bookmark),
              selected: _checkboxItemA,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BasicCheckbox(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BasicCheckbox extends StatefulWidget {
  @override
  _BasicCheckboxState createState() => _BasicCheckboxState();
}

class _BasicCheckboxState extends State<BasicCheckbox> {
  bool _checkboxItem = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Checkbox(
        value: _checkboxItem,
        onChanged: (value)  {
              setState(() {
                _checkboxItem = value;
              });
            },
        activeColor: Colors.black,
      ),
    );
  }
}
