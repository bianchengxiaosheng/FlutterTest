import 'package:english_words/english_words.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

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
        body:Column(

          children: <Widget>[
            titleSection,

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

class RandomWords extends StatefulWidget{
  @override
  createState() => new RandomWordsState();

}
class RandomWordsState extends State<RandomWords>{
  final _suggenstions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _saved = new Set<WordPair>();

  @override
  Widget build(BuildContext context) {

//    final wordPair = new WordPair.random();
//    return new Text(wordPair.asPascalCase);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Listvie build"),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestions(),
    );
  }
  Widget _buildSuggestions(){
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context,i){
        if(i.isOdd) return new Divider();
        final index = i ~/2;
        if(index >= _suggenstions.length){
          _suggenstions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggenstions[index]);

      }
    );
  }
  Widget _buildRow(WordPair pair){
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved?Icons.favorite:Icons.favorite_border,
        color: alreadySaved?Colors.red:null,
      ),
      onTap: (){
        setState(() {
          if(alreadySaved){
            _saved.remove(pair);
          }else{
            _saved.add(pair);
          }
        });
      },
    );
  }



  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(builder:(context){
        final titles = _saved.map(
            (pair){
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            }
        );
        final divided = ListTile
            .divideTiles(
              context:context,
              tiles:titles,
            ).toList();
        return new Scaffold(
          appBar: new AppBar(
            title: new Text("saved suggestons"),
          ),
          body: new ListView(children:divided,),
        );
      })
    );
  }
}

