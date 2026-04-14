import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

@Preview(name: "expanded")
Widget expandedPage() {
  return SizedBox(
    height: 300,
    child: Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Container(height: 40, color: Colors.red),
          Container(height: 40, color: Colors.yellow),
          Expanded(child: Container(color: Colors.green)),
        ],
      ),
    ),
  );
}
