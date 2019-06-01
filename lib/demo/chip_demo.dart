import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  // 列表生成带删除功能的 Chip
  List<String> _tags = ['Audi', 'BMW', 'Benz'];

  String _actionChipValue = 'Nothing';
  List<String> _selected = [];

  String _choice = 'Benz';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChipDemo'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Wrap(
              // 设置组件之间间隔
              spacing: 8.0,
              // 行与行之间间隔
              runSpacing: 8.0,
              children: <Widget>[
                Chip(
                  label: Text('Life'),
                ),
                Chip(
                  label: Text('Sunset'),
                  backgroundColor: Colors.orange,
                ),
                Chip(
                  label: Text('Qiaoluheng'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Text('乔'),
                  ),
                ),
                Chip(
                  label: Text('QiaoTong'),
                  avatar: CircleAvatar(
                    backgroundImage:
                        NetworkImage('http://www.yiyuhengxin.com/favicon.ico'),
                  ),
                ),
                // 带删除icon的chip
                Chip(
                  label: Text('City'),
                  onDeleted: () {},
                  deleteIcon: Icon(Icons.delete_forever),
                  deleteIconColor: Colors.redAccent,
                  // 长按删除按钮提示
                  deleteButtonTooltipMessage: 'Remove this tag',
                ),
                // 分割线====带删除功能的Chip
                Divider(
                  color: Colors.grey,
                  // divider 高度
                  height: 32.0,
                  // 设置缩进
                  // indent: 32.0,
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((tag) {
                    return Chip(
                      label: Text(tag),
                      onDeleted: () {
                        setState(() {
                          _tags.remove(tag);
                        });
                      },
                    );
                  }).toList(),
                ),
                // 分割线====ActionChip
                Divider(
                  color: Colors.grey,
                  // divider 高度
                  height: 32.0,
                  // 设置缩进
                  // indent: 32.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text('ActionChip: $_actionChipValue'),
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((tag) {
                    return ActionChip(
                      label: Text(tag),
                      onPressed: () {
                        setState(() {
                          _actionChipValue = tag;
                        });
                      },
                    );
                  }).toList(),
                ),
                // 分割线====FilterChip
                Divider(
                  color: Colors.grey,
                  // divider 高度
                  height: 32.0,
                  // 设置缩进
                  // indent: 32.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text('FilterChip: ${_selected.toString()}'),
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((tag) {
                    return FilterChip(
                      label: Text(tag),
                      // list.contains(tag) == list数组中是否包含tag，返回bool
                      selected: _selected.contains(tag),
                      onSelected: (value) {
                        setState(() {
                          if(_selected.contains(tag)){
                            _selected.remove(tag);
                          } else{
                            _selected.add(tag);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
                // 分割线====ChoiceChip
                Divider(
                  color: Colors.grey,
                  // divider 高度
                  height: 32.0,
                  // 设置缩进
                  // indent: 32.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text('ChoiceChip: ${_choice}'),
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((tag) {
                    return ChoiceChip(
                      label: Text(tag),
                      selectedColor: Colors.black,
                      selected: _choice == tag,
                      onSelected: (value) {
                        setState(() {
                          _choice = tag;
                        });
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restore),
        onPressed: () {
          setState(() {
            _tags = ['Audi', 'BMW', 'Benz'];

            _selected = [];
          });
        },
      ),
    );
  }
}
