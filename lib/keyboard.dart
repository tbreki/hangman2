import 'dart:math';
import 'package:flutter/material.dart';

keyboard() {
  Center(
      child: Column(children: [
    const Padding(padding: EdgeInsets.only(top: 140.0)),
    const Text(
      'Guess:',
      style: TextStyle(color: Colors.red, fontSize: 25.0),
    ),
    const Padding(padding: EdgeInsets.only(top: 50.0)),
    TextFormField(
      decoration: InputDecoration(
        labelText: "Enter Name",
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(),
        ),
        //fillColor: Colors.green
      ),
      validator: (val) {
        if (val?.length == 0) {
          return "please input letter";
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.text,
      style: const TextStyle(
        fontFamily: "Poppins",
      ),
    ),
  ]));
}
