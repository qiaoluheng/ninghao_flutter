import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
        // Theme 指的就是离Theme最近的主题
        // data: ThemeData(
        //  primaryColor: Colors.black,
        // ),
        // 覆盖主题
        data: Theme.of(context).copyWith(
          primaryColor: Colors.black,
        ),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  RegisterFormState createState() => RegisterFormState();
}

class RegisterFormState extends State<RegisterForm> {
  // form 使用 key 引用表单
  final registerFormKey = GlobalKey<FormState>();
  String username, password;

  //  自动验证是否打开
  bool autovalidate = false;

  void submitRegisterForm() {
    // 表单验证失败，打开表单自动验证功能
    if (registerFormKey.currentState.validate()) {
      registerFormKey.currentState.save();
      debugPrint('username: $username');
      debugPrint('password: $password');

      Scaffold.of(context).showSnackBar(
        SnackBar(
          content:Text('Registering...'),
        )
      );

    } else{
      setState(() {
        autovalidate = true;
      });
    }

  }

  String validateUsername(value) {
    if (value.isEmpty) {
      return 'Username is required..';
    }
    return null;
  }

  String validatePassword(value) {
    if (value.isEmpty) {
      return 'password is required.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Username',
              helperText: '123', //输入提示信息
            ),
            onSaved: (value) {
              username = value;
            },
            validator: validateUsername,
            // 自动验证
            // autovalidate: true,
            autovalidate: autovalidate,
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              helperText: '',
            ),
            onSaved: (value) {
              password = value;
            },
            validator: validatePassword,
            autovalidate: autovalidate,
          ),
          SizedBox(
            height: 32.0,
          ),
          Container(
            width: double.infinity,
            child: RaisedButton(
              color: Theme.of(context).accentColor,
              child: Text('Register', style: TextStyle(color: Colors.white)),
              elevation: 0.0,
              onPressed: submitRegisterForm,
            ),
          )
        ],
      ),
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  TextFieldDemoState createState() => TextFieldDemoState();
}

class TextFieldDemoState extends State<TextFieldDemo> {
  final textEditingController = TextEditingController();

  //销毁 textEditingController
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  // 初始化
  @override
  void initState() {
    super.initState();
    // 设置文本框初始值
    textEditingController.text = 'hi';
    // 监听文本框
    textEditingController.addListener(() {
      debugPrint('input: ${textEditingController.text}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      // onChanged: (value){
      //   debugPrint('input:$value');
      // },
      onSubmitted: (value) {
        debugPrint('submit: $value');
      },
      // 定制文本框样式
      decoration: InputDecoration(
        icon: Icon(Icons.subject),
        labelText: 'Text',
        // 设置placeholder
        hintText: 'Enter the post title.',
        // 边框设置成none
        //border: InputBorder.none,
        //border: OutlineInputBorder(),
        // 设置背景是否显示
        filled: true,
        // 设置背景颜色
        fillColor: Colors.orangeAccent,
      ),
    );
  }
}

class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // primaryColor，是在main中设置ThemeData.primarySwatch
      color: Theme.of(context).accentColor,
    );
  }
}
