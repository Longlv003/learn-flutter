import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

@Preview(name: "Form Login")
Widget formLoginPage() {
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 12),

            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(labelText: "Password"),
            ),
            const SizedBox(height: 12),

            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(labelText: "Confirm Password"),
            ),
          ],
        ),
      ),
    ),
  );
}
