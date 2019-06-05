import 'package:flutter/material.dart';
import '../model/post.dart';

// 带分页功能的表格
class PostDataSource extends DataTableSource {
  final List<Post> _posts = posts;
  int _selectedCount = 0;

  @override
  int get rowCount => _posts.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  @override
  DataRow getRow(int index) {
    final Post post = _posts[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text(post.title)),
        DataCell(Text(post.author)),
        DataCell(Image.network(post.imageUrl)),
      ],
    );
  }

  void _sort(getField(post), bool ascending){
    _posts.sort((a,b) {
      if(!ascending){
        final c =a;
        a=b;
        b=c;
      }
      final aValue = getField(a);
      final bValue = getField(b);
      return Comparable.compare(aValue, bValue);
    });
    notifyListeners();
  }
}

// 数据渲染表格
class PaginatedDataTableDemo extends StatefulWidget {
  @override
  _PaginatedDataTableDemoState createState() => _PaginatedDataTableDemoState();
}

class _PaginatedDataTableDemoState extends State<PaginatedDataTableDemo> {
  int _sortColumnIndex;
  bool _sortAscending = true;

  final PostDataSource _postsDataSource = PostDataSource();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PaginatedDataTableDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: PaginatedDataTable(
          header: Text('Posts'),
          // 每页显示行数
          rowsPerPage: 5,
          source: _postsDataSource,
          sortColumnIndex: _sortColumnIndex,
          sortAscending: _sortAscending,
          columns: [
            DataColumn(
              label: Text('Title'),
              // index 表示 将要排序的索引号， ascending 表示 是否升序排列
              onSort: (int columnIndex, bool ascending) {
                _postsDataSource._sort((post) => post.title.length, ascending);
                setState(() {
                  _sortColumnIndex = columnIndex;
                  _sortAscending = ascending;
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
        ),
      ),
    );
  }
}
