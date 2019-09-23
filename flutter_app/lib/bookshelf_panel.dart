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
    height: 60,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 30
          ),
        ),
        Text(
          label + "kksdfsdhgksdhg",
          style: TextStyle(
              fontSize: 10
          ),
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.red,
        )

      ],
    )

  );
}