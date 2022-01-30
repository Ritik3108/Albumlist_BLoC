// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Errortxt extends StatelessWidget {
  final String message;
  final Function onTap;
  const Errortxt({this.message, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: InkWell(
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
          ),
        ),
      ),
    );
  }
}
