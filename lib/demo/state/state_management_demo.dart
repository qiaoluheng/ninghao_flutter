import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

/**
 * 状态管理
 */
// 子父组件之间相互传值
class StateManagementDemo extends StatefulWidget {
  @override
  _StateManagementDemoState createState() => _StateManagementDemoState();
}

class _StateManagementDemoState extends State<StateManagementDemo> {
  int _count = 0;

  void _increaseCount() {
    setState(() {
      _count += 1;
    });
    print(_count);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StateManagementDemo'),
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text('构造函数 方式提供值'),
            CounterWrapper(_count, _increaseCount),
            SizedBox(height: 30,),
            Text('Provider 方式提供值'),
            CounterProvider(
              count: _count,
              increaseCount: _increaseCount,
              child: CounterWrapper1(),
            ),
            SizedBox(height: 30,),
            Text('ScopedModel 方式提供值'),
            ScopedModelStateManagement(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _increaseCount,
      ),
    );
  }
}

// 多层传值，方式一，StateManagementDemo => CounterWrapper => Counter
class CounterWrapper extends StatelessWidget {
  final int count;
  final VoidCallback increaseCount;
  // const Counter({Key key, this.count}) : super(key: key);
  CounterWrapper(this.count, this.increaseCount);

  @override
  Widget build(BuildContext context){
    return Center(
      child: Counter(count, increaseCount),
    );
  }
}

class Counter extends StatelessWidget {
  final int count;
  final VoidCallback increaseCount;
  // const Counter({Key key, this.count}) : super(key: key);
  Counter(this.count, this.increaseCount);
  @override
  Widget build(BuildContext context) {
    return ActionChip(
        label: Text('$count'),
        onPressed: increaseCount,
    );
  }
}

// ******************************** 方式二 **********************************
class CounterWrapper1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Counter1(),
    );
  }
}

class Counter1 extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final int count = CounterProvider.of(context).count;
    final VoidCallback increaseCount = CounterProvider.of(context).increaseCount;
    return ActionChip(
        label: Text('$count'),
        backgroundColor: Colors.redAccent,
        onPressed: increaseCount,
    );
  }
}

// InheritedWidget方式传值，直接把值传给需要的小部件(隔过中间组件多层传值), StateManagementDemo => CounterProvider
class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback increaseCount;
  final Widget child;

  // super，执行的是父组件的构造函数
  CounterProvider({
    this.count,
    this.increaseCount,
    this.child
  }) : super(child: child);

  static CounterProvider of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(CounterProvider);
  }
   
  //  是否重建 继承的小部件
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

}

// ******************************** 方式三 *****************************************
// 使用scoped_model方式传值, 需要安装 scoped_model 插件

class ScopedModelStateManagement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: CounterModel(),
      child: Container(
        child: Row(
          children: <Widget>[
           ScopedModelDescendant<CounterModel>(
            // 值发生变化是否需要重建 
             rebuildOnChange: false,
              //  context， 可选的子部件，model
             builder: (context, _, model) => 
              IconButton(
              onPressed: model.increaseCount,
              icon: Icon(Icons.add),
            ),
           ),
           Counter2(),
          ],
        ),
      ),
    );
  }
}

class Counter2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CounterModel>(
      builder: (context, _, model) => ActionChip(
        label: Text('${model.count}'),
        onPressed: model.increaseCount,
      ),
    );
  }
}


class CounterModel extends Model {
  int _count = 0;
  int get count => _count;

  void increaseCount() {
    _count += 1;
    // 重建小部件
    notifyListeners();
  }
}

