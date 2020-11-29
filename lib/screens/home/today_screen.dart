import 'package:app_good_caloric_burn/common/appColors.dart';
import 'package:app_good_caloric_burn/models/user.dart';
import 'package:app_good_caloric_burn/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_good_caloric_burn/common/loading.dart';

class TodayScreen extends StatefulWidget {
  @override
  _TodayScreenState createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    var size = MediaQuery.of(context).size;

    return StreamBuilder<UserModel>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserModel userData = snapshot.data;
            double tmb;
            double dcn;
            double bmi;
            String suggestion;
            String bmiClass;

            if (userData.sexo == 0) {
              tmb = 66 +
                  (13.8 * userData.peso) +
                  (5 * userData.altura) -
                  (6.8 * userData.idade);
            } else {
              tmb = 655 +
                  (9.6 * userData.peso) +
                  (1.8 * userData.altura) -
                  (4.7 * userData.idade);
            }

            switch (userData.objetivo) {
              case 0: // lose weight
                dcn = tmb - 500;
                suggestion =
                    "Try to eat protein, fat, and vegetables. Cut back on refined carbs, sugars, and starches. Move your body, exercises, while not required to lose weight, can help you lose weight more quickly. Get good quality sleep.";
                break;
              case 1: // keep weight
                dcn = tmb;
                suggestion =
                    "To keep weight you need to burn the same amount of calories you eat and drink. Limit portion size to control calorie intake. Be  as physically active as you can be.";
                break;
              case 2: // gain weight
                dcn = tmb + 500;
                suggestion =
                    "Eat energy-dense foods and use sauces, spices and condiments. Eating whole fruits is fine, but try to emphasize fruit that doesn't require too much chewing, such as bananas. Do exercises that requires heavy weights and improve your strenght.";
                break;
              default:
            }

            bmi = (userData.peso / userData.altura / userData.altura) * 10000;

            if (bmi < 18.5) {
              bmiClass = "Underweight";
            } else if ((18.5 <= bmi) && (bmi <= 24.9)) {
              bmiClass = "Healthy";
            } else if ((25.0 <= bmi) && (bmi <= 29.9)) {
              bmiClass = "Pre-Obesity";
            } else if ((30.0 <= bmi) && (bmi <= 34.9)) {
              bmiClass = "Obesity Class I";
            } else if ((35.0 <= bmi) && (bmi <= 39.9)) {
              bmiClass = "Obesity Class II";
            } else {
              bmiClass = "Obesity Class III";
            }

            return Scaffold(
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
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Align(
                            alignment: Alignment.center,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  height: size.height * 0.05,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    SizedBox(
                                      width: size.width * .05,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          tmb.toStringAsFixed(0),
                                          style: Theme.of(context)
                                              .textTheme
                                              .display1
                                              .copyWith(
                                                  fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          "Basal Metabolic Rate",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          dcn.toStringAsFixed(0),
                                          style: Theme.of(context)
                                              .textTheme
                                              .display1
                                              .copyWith(
                                                  fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          'Daily Caloric Need',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: size.width * .05,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * .07,
                                ),
                                Text(
                                  'Suggestion',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                                Divider(
                                  height: 10,
                                  color: Colors.black,
                                ),
                                Text(
                                  suggestion,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * .02,
                                ),
                                Text(
                                  'Body Mass Index',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                                Divider(
                                  height: 15,
                                  color: Colors.black,
                                ),
                                Text(
                                  bmi.toStringAsFixed(2),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 36,
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * .05,
                                ),
                                Text(
                                  'BMI Classification',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                                Divider(
                                  height: 15,
                                  color: Colors.black,
                                ),
                                Text(
                                  bmiClass,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 36,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
