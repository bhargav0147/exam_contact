import 'package:exam_contact/Screen/homeScreen.dart';
import 'package:exam_contact/Screen/newContact.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => HomeScreen(),
      'add': (context) => AddContact(),
    },
  ));
}
