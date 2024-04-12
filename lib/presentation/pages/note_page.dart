import 'package:flutter/material.dart';

class note extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          "Screen 4",
          style: TextStyle(color: Colors.blue),
        ),
      ),
    );
  }
}