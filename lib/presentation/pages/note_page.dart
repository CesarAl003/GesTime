import 'package:flutter/material.dart';

class note extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          "Notas",
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}