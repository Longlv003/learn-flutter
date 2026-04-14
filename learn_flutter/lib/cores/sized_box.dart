import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

@Preview(name: "SizedBox")
Widget sizedBoxPage() {
  return Column(
    children: [
      Text("Email"),
      SizedBox(height: 10),
      TextField(),
      SizedBox(height: 20),
      ElevatedButton(onPressed: () {}, child: Text("Submit")),
    ],
  );
}
