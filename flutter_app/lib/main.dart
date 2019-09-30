import 'package:english_words/english_words.dart' as prefix0;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'bookshelf_widget.dart';
import 'find_new_book_widget.dart';
import 'setting_widget.dart';

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
        body: Stack(
          children: <Widget>[
            //bookshelf_container(),
            find_new_book_container()

          ],
        ),
        bottomNavigationBar: BottomTabs(), //显示在页面底部的导航栏
      ),
    );
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
            return bookshelf_container();
            break;
          case 1:
            return find_new_book_container();
            break;
          case 2:
            return setting_container();
            break;
        }
      },
    );
  }


}

