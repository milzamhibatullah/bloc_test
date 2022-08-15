import 'package:bloc_test/ui/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/':(_)=>Home()
    },
  ));
}

