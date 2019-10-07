import 'dart:ui';

import 'package:english_words/english_words.dart' as prefix0;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'widget/bookshelf/bookshelf_widget.dart';
import 'widget/findnew/find_new_book_widget.dart';
import 'widget/setting/setting_widget.dart';
final width = window.physicalSize.width;
final height = window.physicalSize.height;
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: "布局测试",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("布局测试"),
        ),
//        body:TestSize(),
        bottomNavigationBar: BottomTabs(), //显示在页面底部的导航栏
      ),
    );
  }
}
class TestSize extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final size = MediaQuery.of(context).size;
    final double _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    print(_pixelRatio);
    print(size.toString());
    print(size.width * _pixelRatio);
    return Center(
      child: Container(
        color: Colors.redAccent,
        width: size.width / 2,
        height: size.height / 2,
      ),
    );;
  }

}
class BottomTabs extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(title: Text("BookShelf"),icon: Icon(Icons.book)),
          BottomNavigationBarItem(title: Text("AddNew"),icon: Icon(Icons.add)),
          BottomNavigationBarItem(title: Text("Settting"),icon: Icon(Icons.settings)),
        ],
      ),
      tabBuilder:(BuildContext context,int index){
        switch(index){
          case 0:
            return BookshelfWidget();
            break;
          case 1:
            return FinNewBookWidget();
            break;
          case 2:
            return setting_container();
            break;
        }
      },
    );
  }


}

