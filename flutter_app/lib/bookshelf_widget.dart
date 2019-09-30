import 'package:flutter/material.dart';

Widget bookshelf_container (){

  return new ListView.builder(
    padding: const EdgeInsets.all(0.0),

    itemBuilder: (context,i){
        //if(i.isOdd) return new Divider();

        return _buildItemRow(i.toString());
    }

  );
}


Widget _buildItemRow(String label){
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
            label,
            textAlign:TextAlign.left ,
            style: TextStyle(
                fontSize: 30
            ),
          ),
        ),
        Container(
          width: 220,

          child:    Text(
             "Content sdjfkj",
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