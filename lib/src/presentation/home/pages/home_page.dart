import 'package:flutter/material.dart';
import 'package:libary_management/src/presentation/home/widgets/header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Header(),
          ],
        ),
      );
      
  }
}