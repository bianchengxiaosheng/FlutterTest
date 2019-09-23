import 'package:english_words/english_words.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'bookshelf_panel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    Widget buttonSection = Container(
      decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 1.0,color: Colors.grey)
          )
      ),
      //alignment: new FractionalOffset(0.0, 0.0),
      child: Row(

        mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
        children: <Widget>[
          _buildButtonColumn(color, Icons.book, "BookShelf"),
          _buildButtonColumn(color, Icons.add, "AddNew"),

          _buildButtonColumn(color, Icons.settings, "Settting"),


        ],
      ),

    );
    return new MaterialApp(
      title: "布局测试",
      home: new Scaffold(

          appBar: new AppBar(
          title: new Text("布局测试"),
        ),
        body:Stack(

          children: <Widget>[
            bookshelf_container(),

          ],

        ),
        bottomNavigationBar: buttonSection,//显示在页面底部的导航栏

      ),
    );
  }
  
}


Column _buildButtonColumn(Color color,IconData icon,String label){
  return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,

    children: <Widget>[
      Icon(icon,color: color),
      Container(

        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color
          ),
        ),
      )

    ],
  );
}
Widget titleSection = new Container(
  padding: const EdgeInsets.all(32.0),
  child: new Row(
    children: <Widget>[
      new Expanded(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: new Text(
                  'Oeschinen Lake Campground',
                  style: new TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              new Text(
                'Kandersteg, Switzerland',
                style: new TextStyle(
                  color: Colors.grey[500],
                ),
              ),

            ],
          )
      ),
      new Icon(
        Icons.star,
        color: Colors.red[500],
      ),
      new Text('41'),

    ],
  ),
);

