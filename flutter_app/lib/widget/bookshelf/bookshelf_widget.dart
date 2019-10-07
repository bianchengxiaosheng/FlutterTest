import 'package:flutter/material.dart';
import 'dart:convert';

import '../../model/bookshelf_model.dart';

class BookshelfWidget extends StatelessWidget{
  List data;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Bookshelf"),
      ),
      body: new Center(
        child: FutureBuilder(
            future: DefaultAssetBundle.of(context).loadString("mock/BookshelfModelMockData.json"),
            builder: (context,snapshot){
              data = new List();
              var jsonData = jsonDecode(snapshot.data.toString())["data"];
              for(int i = 0;i < jsonData.length;i++ ){
                var book = BookshelfModel.fromJson(jsonData[i]);
                data.add(book);

              }

              return new ListView.builder(
                  padding: const EdgeInsets.all(0.0),

                  itemBuilder: (context,i){
                    //if(i.isOdd) return new Divider();

                    return _buildItemRow(data[i]);
                  },
                itemCount: data == null?0:data.length,

              );
            }
        ),
      ),
    );



  }

}



Widget _buildItemRow(BookshelfModel data){
  return Container(
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(width: 1.0,color: Colors.red)
      )
    ),
    height: 60,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 100,
          alignment: Alignment.centerLeft,
          color: Colors.green,
          child:new Text(
            data.bookName,
            textAlign:TextAlign.left ,
            style: TextStyle(
                fontSize: 30
            ),
          ),
        ),
        Container(
          width: 220,

          child:    Text(
             data.describe,
            style: TextStyle(
                fontSize: 10
            ),
          ),

        ),

        Container(
          width: 60,
          height: 60,
          alignment: Alignment.centerRight,
          color: Colors.red,
          child: Text("DEL")
        )

      ],
    )

  );
}