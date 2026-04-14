import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:logger/logger.dart';

var logger = Logger();

@Preview(name: "column")
Widget columnPage() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(Icons.lock, size: 80),
      SizedBox(height: 20),
      Text("Welcome"),
      SizedBox(height: 20),
      TextField(decoration: InputDecoration(labelText: "Email")),
      SizedBox(height: 10),
      TextField(decoration: InputDecoration(labelText: "Password")),
      SizedBox(height: 20),
      ElevatedButton(
        onPressed: () {
          logger.d("Login success");
        },
        child: Text("Login"),
      ),
    ],
  );
}
