import 'package:flutter/material.dart';
import '../model/post.dart';

// 表格基础展示
class DataTableDemo extends StatefulWidget {
  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DataTableDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            DataTable(
              columns: [
                DataColumn(
                  label: Text('title'),
                ),
                DataColumn(
                  label: Text('Author'),
                ),
              ],
              rows: [
                DataRow(
                  cells: [
                    DataCell(
                      Text('Comp'),
                    ),
                    DataCell(
                      Text('qlh'),
                    ),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text('Coms'),
                    ),
                    DataCell(
                      Text('qiao'),
                    ),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text('Compo'),
                    ),
                    DataCell(
                      Text('lu'),
                    ),
                  ],
                ),
              ],
            ),
            Divider(
              color: Colors.black,
              height: 30.0,
            ),
            Text('DataTableForData:'),
            // dataTable for data 
            DataTableForDataDemo(),
          ],
        ),
      ),
    );
  }
}

// 数据渲染表格
class DataTableForDataDemo extends StatefulWidget {
  @override
  _DataTableForDataDemoState createState() => _DataTableForDataDemoState();
}

class _DataTableForDataDemoState extends State<DataTableForDataDemo> {
  int _sortColumnIndex;
  bool _sortAscending = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DataTable(
        // 排序列索引号
        sortColumnIndex: _sortColumnIndex,
        // 标识排序方式 false 降序排列(从大到小)，true 升序排列(从小到大)
        sortAscending: _sortAscending,
        // 全选方法的实现
        // onSelectAll: (bool value) {

        // },
        columns: [
          DataColumn(
            // 设置栏目宽度
            // label: Container(
            //   width: 150.0,
            //   child: Text('title'),
            // ),
            label: Text('Title'),
            // index 表示 将要排序的索引号， ascending 表示 是否升序排列
            onSort: (int index,bool ascending) {
              setState(() {
                _sortColumnIndex = index;
                _sortAscending = ascending;
                posts.sort((a,b) {
                  if(!ascending){
                    final c = a;
                    a = b;
                    b = c;
                  }
                  return a.title.length.compareTo(b.title.length);
                });
              });
            },
            ),
          DataColumn(
            label: Text('Auther'),
            ),
          DataColumn(
            label: Text('Image'),
          ),
        ],
        rows: posts.map((post) {
          return DataRow(
            selected: post.selected,
            onSelectChanged: (bool value) {
              setState(() {
                if(post.selected != value){
                  post.selected = value;
                }
              });
            },
            cells: [
              DataCell(Text(post.title)),
              DataCell(Text(post.author)),
              DataCell(Image.network(post.imageUrl)),
            ]
          );
        }).toList(),
      ),
    );
  }
}


