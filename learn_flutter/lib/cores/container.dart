import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

@Preview(name: "Container")
Widget containerpage() {
  return Container(
    margin: EdgeInsets.all(16),
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.blue.shade100,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 3)),
      ],
    ),
    child: Column(
      children: [
        CircleAvatar(radius: 30, child: Icon(Icons.person)),
        SizedBox(height: 10),
        Text("LongLV", style: TextStyle(fontSize: 18)),
        Text("Flutter Developer"),
      ],
    ),
  );
}
