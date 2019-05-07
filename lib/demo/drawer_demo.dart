import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // DrawerHeader(
            //   padding: EdgeInsets.only(left: 28),
            //   child: Text('header'.toUpperCase()),
            //   decoration: BoxDecoration(
            //     color: Colors.grey[300],
            //   ),
            // ),
            UserAccountsDrawerHeader(
              accountName: Text('qiaoluheng',style:TextStyle(fontWeight: FontWeight.bold)),
              accountEmail: Text('luheng.86@163.com',style:TextStyle(fontWeight: FontWeight.w900)),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage('https://profile.csdnimg.cn/3/D/C/1_qiaoluheng')
              ),
              // 添加背景图片
              decoration: BoxDecoration(
                color: Colors.yellow[400],
                image: DecorationImage(
                  image: NetworkImage('https://profile.csdnimg.cn/3/D/C/1_qiaoluheng'),
                  fit: BoxFit.cover,
                  // 添加滤镜（阴影图层） ,withOpacity设置颜色的透明度
                  colorFilter: ColorFilter.mode(Colors.yellow[400].withOpacity(0.6), BlendMode.hardLight),
                  ),

              ),
            ),
            ListTile(
              title: Text('Messages',textAlign: TextAlign.right,),
              // 文字后面设置内容
              trailing: Icon(Icons.message,color:Colors.black12,size:22.0),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: Text('Favorite',textAlign: TextAlign.right,),
              // 文字后面设置内容
              trailing: Icon(Icons.favorite,color:Colors.black12,size:22.0),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: Text('Settings',textAlign: TextAlign.right,),
              // 文字后面设置内容
              trailing: Icon(Icons.settings,color:Colors.black12,size:22.0),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      );
  }
}