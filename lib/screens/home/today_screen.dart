import 'package:app_good_caloric_burn/common/appColors.dart';
import 'package:flutter/material.dart';

class TodayScreen extends StatefulWidget {
  @override
  _TodayScreenState createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: <Widget>[
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                              width: size.width * .05,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  '0',
                                  style: Theme.of(context)
                                      .textTheme
                                      .display1
                                      .copyWith(fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "Basal Metabolic Rate",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  '1864',
                                  style: Theme.of(context)
                                      .textTheme
                                      .display1
                                      .copyWith(fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  'Daily Caloric Need',
                                  style: TextStyle(fontWeight: FontWeight.bold),
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
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vitae enim vulputate, tempus leo nec, fermentum tellus. Etiam auctor erat quis turpis elementum, id posuere nisi volutpat. Aenean venenatis, lectus vitae feugiat congue, tellus odio faucibus elit, a finibus justo magna placerat tortor.',
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
                          '21.30',
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
                          'Healthy',
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
          ),
        ],
      ),
    );
  }
}
