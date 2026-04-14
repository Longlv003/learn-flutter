import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

@Preview(name: "row")
Widget rowPage() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Icon(Icons.thumb_up), Text("Like")],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Icon(Icons.comment), Text("Comment")],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Icon(Icons.share), Text("Share")],
      ),
    ],
  );
}
