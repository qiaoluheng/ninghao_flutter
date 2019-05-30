import 'package:flutter/material.dart';

class ExpansionPanelItem {
  final String headerText;
  final Widget body;
  bool isExpanded;
  ExpansionPanelItem({
    this.headerText,
    this.body,
    this.isExpanded,
  });
}

// 折叠 面板列表
class ExpansionPanelDemo extends StatefulWidget {
  @override
  _ExpansionPanelDemoState createState() => _ExpansionPanelDemoState();
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {
  bool _isExpanded = false;

  List<ExpansionPanelItem> _expansionPanelItems;

  // 初始化数据
  @override
  void initState() { 
    super.initState();
    _expansionPanelItems = <ExpansionPanelItem>[
      ExpansionPanelItem(
        headerText: 'Panel A',
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text('Content for Panel A.'),
          ),
        isExpanded: true,
      ),
      ExpansionPanelItem(
        headerText: 'Panel B',
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text('Content for Panel B.'),
          ),
        isExpanded: false,
      ),
      ExpansionPanelItem(
        headerText: 'Panel C',
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text('Content for Panel C.'),
          ),
        isExpanded: false,
      ),

    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpansionPanelDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ExpansionPanelList(
              expansionCallback: (int panelIndex,bool isExpanded) {
                setState(() {
                  // 单个 panel 设置
                  // _isExpanded = !_isExpanded;
                  // 多个 panel 设置
                  _expansionPanelItems[panelIndex].isExpanded = !_expansionPanelItems[panelIndex].isExpanded;
                });
              },
              // 单个panel 展示方式
              // children: [
                // ExpansionPanel(
                //   headerBuilder: (BuildContext context, bool isExpanded) {
                //     return Container(
                //       padding: EdgeInsets.all(16.0),
                //       child: Text('Panel A',style: Theme.of(context).textTheme.title,),
                //     );
                //   },
                //   body: Container(
                //     padding: EdgeInsets.all(16.0),
                //     width: double.infinity,
                //     child: Text('Content for Panel A.'),
                //   ),
                //   isExpanded: _isExpanded,
                // ),
              // ],
              // 多个panel 展示方式
              children: _expansionPanelItems.map(
                (ExpansionPanelItem item) {
                  return ExpansionPanel(
                    isExpanded: item.isExpanded,
                    body: item.body,
                    headerBuilder: (BuildContext context, bool isExpanded){
                      return Container(
                        padding: EdgeInsets.all(16.0),
                        child: Text(item.headerText),
                      );
                    }
                  );
                }
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}