import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

@Preview(name: "GridView")
Widget gridViewPage() {
  return Scaffold(
    body: GridView.builder(
      itemCount: 6,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            "Item $index",
            style: const TextStyle(color: Colors.white),
          ),
        );
      },
    ),
  );
}
