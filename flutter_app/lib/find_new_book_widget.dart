import 'package:flutter/material.dart';

Widget find_new_book_container()
{
  return new ListView.builder(
      padding: const EdgeInsets.all(0.0),
      itemBuilder: (context,i){
        return _book_row("");
      }
  );

}
Widget _book_row(String data){
  const String temData = "Quickly ship features with a focus on native end-user experiences. Layered architecture allows for full customization, which results in incredibly fast rendering and expressive and flexible designs.";
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
        Text("圣诞节法式咖啡嘎斯咖啡馆")
      ],
    ),
  );
}

