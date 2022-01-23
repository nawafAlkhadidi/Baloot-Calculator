import 'package:flutter/material.dart';

class WidgetOfNumber extends StatelessWidget {
  final String number;
  const WidgetOfNumber({
    required this.number,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return Text(
      number,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 40,
        color: Colors.white,
      ),
    );
  }
}