import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/model/find_new.dart';

class FinNewBookWidget extends StatelessWidget
{
  List data;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Find New Book"),

      ),
      body: new Center(
        child: FutureBuilder(
            future: DefaultAssetBundle.of(context).loadString("mock/FindNewMockData.json"),
            builder: (context,snapshot){
              data = new List();
              var jsonData = jsonDecode(snapshot.data.toString())["data"];
              for(int i = 0;i < jsonData.length;i++ ){
                var book = FindNew.fromJson(jsonData[i]);
                data.add(book);

              }

              return new ListView.builder(
                padding: const EdgeInsets.all(0.0),

                itemBuilder: (context,i){
                  //if(i.isOdd) return new Divider();

                  return _book_row(data[i]);
                },
                itemCount: data == null?0:data.length,

              );
            }
        ),
      ),
    );
  }

}



Widget _book_row(FindNew data){

  return Container(
    height: 150,
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(width: 1,color: Colors.red)
      )
    ),
    child: Row(

      children: <Widget>[
        Image.asset('images/test.jpg',width: 130,height: 130,),
        Text(data.describe)
      ],
    ),
  );
}

