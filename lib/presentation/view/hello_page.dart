import 'package:flutter/material.dart';

class HelloPage extends StatelessWidget {
  const HelloPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [Text('Hello World'), CircularProgressIndicator()],
        ),
      ),
    );
  }
}
