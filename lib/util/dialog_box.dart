// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:f_firstapp/util/my_buttons.dart';
import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 120,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Add a new task'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MyButtons(text: 'Save', onPressed: onSave),
              const SizedBox(
                width: 10,
              ),
              MyButtons(text: 'Cancel', onPressed: onCancel)
            ],
          )
        ]),
      ),
    );
  }
}
