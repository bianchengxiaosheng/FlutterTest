import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/model/find_new.dart';
import 'dart:ui';


class FinNewBookWidget extends StatelessWidget
{
  List data;
  @override
  Widget build(BuildContext context) {

    final Size size =  MediaQuery.of(context).size;
    final double _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    print(size.toString());
    print(size.width);
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Find New Book"),

      ),
      body: new Container(
        child: FutureBuilder(
            future: DefaultAssetBundle.of(context).loadString("mock/FindNewMockData.json"),
            builder: (context,snapshot){
              data = new List();
              var jsonData = jsonDecode(snapshot.data.toString())['data'];
              print(jsonData);
              for(int i = 0;i < jsonData.length;i++ ){
                var book = FindNew.fromJson(jsonData[i]);
                data.add(book);

              }

              return new ListView.builder(
                padding: const EdgeInsets.all(0.0),

                itemBuilder: (context,i){
                  //if(i.isOdd) return new Divider();

                  return _book_row(data[i],size);
                },
                itemCount: data == null?0:data.length,

              );
            }
        ),
      ),
    );
  }

}



Widget _book_row(FindNew data,Size contentSiz){

  return Container(
    height: 100,
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(width: 1,color: Colors.red)
      )
    ),
    child: Row(

      children: <Widget>[
        Image.asset('images/test.jpg',width: 90,height: 90,),
        Container(
          width: contentSiz.width - 90,

          child:  Text(
            data.describe,
            style: TextStyle(
                fontSize: 10
            ),

          ),
        )

      ],
    ),
  );
}

