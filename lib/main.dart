import 'package:flutter/material.dart';
import 'package:fluttertesting/app/app.dart';
import 'package:fluttertesting/app/environment.dart';

void main() {
  Environment environment = Environment.staging();
  runApp(
    MyApp(
      environment: environment
    )
  );
}
