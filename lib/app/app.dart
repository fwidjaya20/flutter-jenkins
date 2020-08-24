import 'package:flutter/material.dart';
import 'package:fluttertesting/app/dependency_injector_container.dart';
import 'package:fluttertesting/app/environment.dart';
import 'package:fluttertesting/features/heroes/presentations/pages/hero_page.dart';
import 'package:meta/meta.dart';

class MyApp extends StatefulWidget {
  final Environment environment;

  MyApp({
    @required this.environment
  });

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    DependencyInjectorContainer().init(env: widget.environment);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Unit Testing',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: HeroPage()
    );
  }
}