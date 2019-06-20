import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class HttpDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HttpDemo'),
      ),
      body: HttpDemoHome(),
    );
  }
}

class HttpDemoHome extends StatefulWidget {
  @override
  _HttpDemoHomeState createState() => _HttpDemoHomeState();
}

class _HttpDemoHomeState extends State<HttpDemoHome> {
  @override
  void initState() {
    super.initState();
    dataChange();

    // then 有返回时候执行
    // fetchPosts()
    //   .then((value) => print(value));
  }

  // 数据转换
  dataChange(){
    final post = {
      'title': 'hello',
      'description': 'nice to meet you.',
    };
    print(post['title']);
    print(post['description']);
    // 转json，传给后台
    final postJson = json.encode(post);
    print(postJson);

    // 转map类型，供页面使用
    final postJsonConverted = json.decode(postJson);
    print(postJsonConverted['title']);
    print(postJsonConverted['description']);
    print(postJsonConverted is Map);

    final postModel = Post.fromJson(postJsonConverted);
    print('title: ${postModel.title}, description: ${postModel.description}');

    // encode 调用 toJson()
    print('${json.encode(postModel)}');
  }

  // 网络请求都是异步方法
  Future<List<Post>> fetchPosts() async {
  
    final response = await http.get('http://localhost:3000/nihao/demo/');
    // print('statusCode: ${response.statusCode}');
    // print('body: ${response.body}');

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      List<Post> posts = responseBody['posts']
          .map<Post>((item) => Post.fromJson(item))
          .toList();
      return posts;
    } else {
      throw Exception('Failed to fetch posts.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchPosts(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        print('data: ${snapshot.data}');
        print('connectionState: ${snapshot.connectionState}');
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(
            child: Text('load...'),
          );
        }
        return ListView(
          children: snapshot.data.map<Widget>((Post item) {
            return ListTile(
              title: Text(item.title),
              subtitle: Text(item.author),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(item.imageUrl),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

// 使用 model 类转换数据类型
class Post {
  final int id;
  final String title;
  final String description;
  final String author;
  final String imageUrl;
  Post(this.id, this.title, this.description, this.author, this.imageUrl);
  // 添加一个构造方法
  Post.fromJson(Map json)
      : id = json['id'],
        title = json['title'],
        description = json['description'],
        author = json['author'],
        imageUrl = json['imageUrl'];

  // encode 调用 toJson()
  Map toJson() => {'title': title, 'description': description};
}
