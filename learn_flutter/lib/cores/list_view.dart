import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

@Preview(name: "ListView")
Widget listViewPage() {
  return Scaffold(
    body: ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: ListTile(
              contentPadding: EdgeInsets.only(left: 10),
              leading: const Icon(Icons.check_box_outline_blank),
              title: Text("Task $index"),
              subtitle: const Text("Pending"),
            ),
          ),
        );
      },
    ),
  );
}
