import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() => runApp(const FamilyApp());

class FamilyApp extends StatelessWidget {
  const FamilyApp();
  // Root application widget
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FamilyHomePage(),
    );
  }
}

class FamilyHomePage extends StatelessWidget {
  const FamilyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}