import 'package:flutter/material.dart';

class ExercisesScreen extends StatefulWidget {
  @override
  _ExercisesScreenState createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends State<ExercisesScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height * .25,
            decoration: BoxDecoration(
              color: Color(0xFF3A67E0),
            ),
          ),
        ],
      ),
    );
  }
}
