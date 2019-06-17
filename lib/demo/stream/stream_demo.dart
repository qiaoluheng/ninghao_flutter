import 'package:flutter/material.dart';
import 'dart:async';

class StreamDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamDemo'),
        elevation: 0.0,
      ),
      body: StreamDemoHome(),
    );
  }
}

class StreamDemoHome extends StatefulWidget {
  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {
  StreamSubscription _streamDemoSubscription;

  StreamController<String> _streamDemo;

  StreamSink _sinkDemo;

  String _data = '...';

  @override
  void dispose() {
    _streamDemo.close();
    super.dispose();
  }

  // 初始化一些数据
  @override
  void initState() {
    super.initState();

    print('Create a stream.');
    // Stream<String> _streamDemo = Stream.fromFuture(fetchData());
    // _streamDemo = StreamController<String>();

    // 多次订阅
    _streamDemo = StreamController.broadcast();

    _sinkDemo = _streamDemo.sink;

    print('Start listening on a stream.');
    // 监听等待返回
    // _streamDemoSubscription =
    //     _streamDemo.listen(onData, onError: onError, onDone: onDone);

    _streamDemoSubscription =
        _streamDemo.stream.listen(onData, onError: onError, onDone: onDone);
    _streamDemo.stream.listen(onDataTwo, onError: onError, onDone: onDone);

    print('Initialize completed.');
  }

  // 当出错时候
  void onError(error) {
    print('Error: $error');
  }

  // 当完成时候
  void onDone() {
    print('Done!');
  }

  // 处理 response
  void onData(String data) {
    // setState(() {
    //   _data = data;
    // });
    print('$data');
  }

  void onDataTwo(String data) {
    print('onDataTwo: $data');
  }

  // 暂停监听 Stream
  void _pauseStream() {
    print('Pause subscription');
    _streamDemoSubscription.pause();
  }

  // 恢复监听 Stream
  void _resumeStream() {
    print('Resume subscription');
    _streamDemoSubscription.resume();
  }

  // 取消监听 Stream
  void _cancelStream() {
    print('Cancel subscription');
    _streamDemoSubscription.cancel();
  }

  void _addDataToStream() async {
    print('Add data to stream.');

    String data = await fetchData();
    // _streamDemo.add(data);
    _sinkDemo.add(data);
  }

  Future<String> fetchData() async {
    // delayed 延时操作
    await Future.delayed(Duration(seconds: 3));
    // 抛异常
    // throw 'Something happened...';
    // 正常返回
    return 'Hello ~';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            // Text(_data),
            StreamBuilder(
              stream: _streamDemo.stream,
              initialData: '...',
              builder: (context, snapshot) {
                return Text('${snapshot.data}');
              },
            ),
            Row(
              children: <Widget>[
                FlatButton(
                  child: Text('Add'),
                  onPressed: _addDataToStream,
                ),
                FlatButton(
                  child: Text('Pause'),
                  onPressed: _pauseStream,
                ),
                FlatButton(
                  child: Text('Resume'),
                  onPressed: _resumeStream,
                ),
                FlatButton(
                  child: Text('Cancel'),
                  onPressed: _cancelStream,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FutureTest {
  // 初始化一些数据
  void initState() {
    print('Create a stream.');
    Stream<String> _streamDemo = Stream.fromFuture(fetchData());

    print('Start listening on a stream.');
    // 监听等待返回
    _streamDemo.listen(onData, onError: onError, onDone: onDone);

    print('Initialize completed.');
  }

  // 处理 response
  void onData(String data) {
    print('$data');
  }

  // 当出错时候
  void onError(error) {
    print('Error: $error');
  }

  // 当完成时候
  void onDone() {
    print('Done!');
  }

  Future<String> fetchData() async {
    // delayed 延时操作
    await Future.delayed(Duration(seconds: 3));
    // 抛异常
    throw 'Something happened...';
    // 正常返回
    // return 'Hello ~';
  }
}
