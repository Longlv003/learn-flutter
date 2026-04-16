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
      Form(
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Password",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.green),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                floatingLabelStyle: TextStyle(color: Colors.green),
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 20),
      SizedBox(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            logger.d("Login success");
          },
          child: Text("Login"),
        ),
      ),
    ],
  );
}
