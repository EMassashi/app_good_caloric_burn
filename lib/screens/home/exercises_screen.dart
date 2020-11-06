import 'package:app_good_caloric_burn/common/appColors.dart';
import 'package:app_good_caloric_burn/models/exercise.dart';
import 'package:app_good_caloric_burn/screens/home/exercise_list.dart';
import 'package:app_good_caloric_burn/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExercisesScreen extends StatefulWidget {
  @override
  _ExercisesScreenState createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends State<ExercisesScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return StreamProvider<List<Exercise>>.value(
      initialData: List(),
      value: DatabaseService().exercises,
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Stack(
          children: [
            Container(
              height: size.height * .25,
              decoration: BoxDecoration(
                color: kBlueColor,
              ),
            ),
            SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Exercises',
                                style: Theme.of(context)
                                    .textTheme
                                    .display1
                                    .copyWith(fontWeight: FontWeight.w800),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 75,
                          ),
                          ExerciseList(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
