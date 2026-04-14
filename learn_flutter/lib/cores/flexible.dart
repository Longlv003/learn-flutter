import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

@Preview(name: "Flexible")
Widget flexiablePage() {
  return Row(
    children: [
      Flexible(flex: 1, child: Container(height: 100, color: Colors.orange)),
      Flexible(flex: 2, child: Container(height: 100, color: Colors.purple)),
    ],
  );
}
