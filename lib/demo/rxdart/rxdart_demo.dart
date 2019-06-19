import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class RxDartDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RxDartDemo'),
        elevation: 0.0,
      ),
      body: Container(
        child: RxDartDemoHome(),
      ),
    );
  }
}

class RxDartDemoHome extends StatefulWidget {
  @override
  _RxDartDemoHomeState createState() => _RxDartDemoHomeState();
}

class _RxDartDemoHomeState extends State<RxDartDemoHome> {

  PublishSubject<String> _textFieldSubject;

  @override
  void initState() {
    super.initState();

    _textFieldSubject = PublishSubject<String>();
    _textFieldSubject
      // .map((item) => 'item: $item')  // 添加 item: 
      // .where((item) => item.length > 10)  // RxDart 条件转换
      .debounceTime(Duration(milliseconds: 3000))
      .listen((data) => print(data)); 



    /** ************** 创建Observable的几种方式 ************** */
    // Observable<String> _observable = Observable(Stream.fromIterable(['hello','你好。。。']));

    // Observable<String> _observable = Observable.fromFuture(Future.value('hello~~~'));

    // Observable<String> _observable = Observable.fromIterable(['hello','你好']);

    // Observable<String> _observable = Observable.just('hello ~');
    // 隔一段时间操作的一次
    // Observable<String> _observable = Observable.periodic(Duration(seconds: 3), (x) => x.toString());
    // _observable.listen(print);

    /** ************** 创建 Subject 的几种方式 ************** */
    // PublishSubject<String> _subject = PublishSubject<String>();

    // 把最后一个数据作为新的交给监听者
    // BehaviorSubject<String> _subject = BehaviorSubject<String>();

    // 把Subject添加的数据全部交给监听者, maxSize：最大接受数据的数量，即使添加了三个数据，监听者接受也是两个
    // ReplaySubject<String> _subject = ReplaySubject<String>(maxSize: 2);

    // subject 上添加数据
    // _subject.add('hellooo');
    // _subject.add('hola');
    // _subject.add('hi');

    // listen 相当于添加了订阅
    // _subject.listen((data) => print('listen 1: $data'));
    // _subject.listen((data) => print('listen 2: ${data.toUpperCase()}'));

    // _subject.close();
  }

  @override
  void dispose() {
    super.dispose();
    _textFieldSubject.close();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Colors.black,
      ),
      child: TextField(
        // 文本框发生变化时候执行
        onChanged: (value) {
          _textFieldSubject.add('input: $value');
        },
        onSubmitted: (value){
          _textFieldSubject.add('submit: $value');
        },
        decoration: InputDecoration(
          labelText: 'Title',
          filled: true,
        ),
      ),
    );
  }
}
