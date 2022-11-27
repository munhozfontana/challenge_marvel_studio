import 'package:flutter/material.dart';

class SubTitle extends StatelessWidget {
  const SubTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'LINHA DO TEMPO',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16,
        height: 1.1,
      ),
    );
  }
}
