import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

@Preview(name: 'Stack')
Widget stackPage() {
  return Stack(
    children: [
      CircleAvatar(radius: 50, child: Icon(Icons.person, size: 40)),
      Positioned(
        right: 0,
        top: 0,
        child: Container(
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
          child: Text(
            "NEW",
            style: TextStyle(color: Colors.white, fontSize: 10),
          ),
        ),
      ),
    ],
  );
}
