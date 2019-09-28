import 'package:english_words/english_words.dart' as prefix0;
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
            //find_new_book_container()
            setting_container()
          ],
        ),
        bottomNavigationBar: BottomWidget(), //显示在页面底部的导航栏
      ),
    );
  }
}

class BottomWidget extends StatefulWidget{
  @override
  BottomWidgetState createState() => BottomWidgetState();

}
class BottomWidgetState extends State<BottomWidget>{
  final _buttons = <BottomButonItem>[];
 void _handleTabHcnage(Key key)
 {
    debugPrint(key.toString());
 }

  @override
  Widget build(BuildContext context) {
    _buttons.clear();
    // TODO: implement build
    _buttons.add(BottomButonItem(
      icon: Icons.book,
      label: "BookShelf",
      onChanged: _handleTabHcnage,
    ));
    _buttons.add(BottomButonItem(
      icon: Icons.add,
      label: "AddNew",
      onChanged: _handleTabHcnage,
    ));
    _buttons.add(BottomButonItem(
      icon: Icons.settings,
      label: "Settting",
      onChanged: _handleTabHcnage,
    ));
    return Container(
      decoration: BoxDecoration(
          border: Border(top: BorderSide(width: 1.0, color: Colors.grey))),
      //alignment: new FractionalOffset(0.0, 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _buttons,
      ),
    );
  }
}

class BottomButonItem extends StatefulWidget {
  bool isActive;
  final ValueChanged<Key> onChanged;
  final IconData icon;
  final String label;
  BottomButonItem({Key key, this.icon, this.label,this.isActive:false,@required this.onChanged}):super(key:key);
  @override
  BottomButtomState createState() => new BottomButtomState();
}

class BottomButtomState extends State<BottomButonItem> {

  void _handleOnClick() {
    debugPrint("sdfsd");
    widget.onChanged(widget.key);
    widget.isActive = !widget.isActive;

  }

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    return new GestureDetector(

      onTap: _handleOnClick,
      child: new Container(
        color: Colors.grey,
        child:  Column(

          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(widget.icon, color: widget.isActive ? Colors.red:color),
            Container(
              color: Colors.grey,
              margin: const EdgeInsets.only(top: 8),
              child: Text(
                widget.label,
                style: TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w400, color:  widget.isActive ? Colors.red:color),
              ),
            )
          ],

        ),
      )


    );

  }
}

Column _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w400, color: color),
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
      )),
      new Icon(
        Icons.star,
        color: Colors.red[500],
      ),
      new Text('41'),
    ],
  ),
);
