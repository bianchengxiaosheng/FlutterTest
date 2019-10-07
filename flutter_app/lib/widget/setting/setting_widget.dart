import 'package:flutter/material.dart';

Widget setting_container()
{
  return Container(
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Image.asset('images/test.jpg',width: 130,height: 130,),
            Text("Setting")
          ],
        ),
        Container(
          height: 60,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 1.0,color: Colors.grey)
              )
          ),
          alignment: Alignment.centerLeft,
          child: Text("Download"),
        )

      ],
    ),
  );
}