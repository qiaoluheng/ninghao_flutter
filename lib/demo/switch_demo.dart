import 'package:flutter/material.dart';

class SwitchDemo extends StatefulWidget {
  @override
  _SwitchDemoState createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {
  bool _switchItemA = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SwitchDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SwitchListTile(
              value: _switchItemA,
              onChanged: (value) {
                setState(() {
                  _switchItemA = value;
                });
               },
               title: Text('Switch Item A'),
               subtitle: Text('Description...'),
               secondary: Icon(_switchItemA ? Icons.visibility : Icons.visibility_off),
               selected: _switchItemA,
              //  activeColor: Colors.orange,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_switchItemA ? '☺':'☹',style: TextStyle(fontSize: 32.0),),
                // Switch(
                //   value: _switchItemA,
                //   onChanged: (value) {
                //     setState(() {
                //       _switchItemA = value;
                //     });
                //   },
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}