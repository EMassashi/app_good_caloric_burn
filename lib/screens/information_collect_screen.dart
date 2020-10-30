import 'package:app_good_caloric_burn/common/appColors.dart';
import 'package:flutter/material.dart';

class InitialForm extends StatefulWidget {
  @override
  _InitialFormState createState() => _InitialFormState();
}

class _InitialFormState extends State<InitialForm> {
  int sexRadio;
  int objectiveRadio;
  int activityLevel;
  @override
  void initState() {
    super.initState();
    sexRadio = 99;
    objectiveRadio = 99;
    activityLevel = 99;
  }

  saveInfo() {
    print('salvo!');
  }

  setSexRadio(int val) {
    setState(() {
      sexRadio = val;
    });
  }

  setObjectiveRadio(int val) {
    setState(() {
      objectiveRadio = val;
    });
  }

  setActivityLevel(int val) {
    setState(() {
      activityLevel = val;
    });
  }

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Basal Metabolic Rate'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'What is your Biological sex?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.end,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Radio(
                            value: 0,
                            groupValue: sexRadio,
                            activeColor: kBlueLightColor,
                            onChanged: (val) {
                              setSexRadio(val);
                            },
                          ),
                          Text(
                            'Male',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          Radio(
                            value: 1,
                            groupValue: sexRadio,
                            activeColor: kBlueLightColor,
                            onChanged: (val) {
                              setSexRadio(val);
                            },
                          ),
                          Text(
                            'Female',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * .05,
                      ),
                      Text(
                        'What is your objective?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Radio(
                            value: 0,
                            groupValue: objectiveRadio,
                            activeColor: kBlueLightColor,
                            onChanged: (val) {
                              setObjectiveRadio(val);
                            },
                          ),
                          Text(
                            'Lose weight',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Radio(
                            value: 1,
                            groupValue: objectiveRadio,
                            activeColor: kBlueLightColor,
                            onChanged: (val) {
                              setObjectiveRadio(val);
                            },
                          ),
                          Text(
                            'keep weight',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Radio(
                            value: 2,
                            groupValue: objectiveRadio,
                            activeColor: kBlueLightColor,
                            onChanged: (val) {
                              setObjectiveRadio(val);
                            },
                          ),
                          Text(
                            'Gain\nweight',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * .05,
                      ),
                      Text(
                        'what is your level of physical activity?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: size.height * .02,
                      ),
                      Container(
                        width: size.width,
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Radio(
                                  value: 0,
                                  groupValue: activityLevel,
                                  activeColor: kBlueLightColor,
                                  onChanged: (val) {
                                    setActivityLevel(val);
                                  },
                                ),
                                Flexible(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        'Sedentary (Spends most of the day sitting or lying down, and does not practice physical activity.',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                  value: 1,
                                  groupValue: activityLevel,
                                  activeColor: kBlueLightColor,
                                  onChanged: (val) {
                                    setActivityLevel(val);
                                  },
                                ),
                                Flexible(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        'Slightly active (Performs some light physical activity, such as short walks in the week).',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                  value: 2,
                                  groupValue: activityLevel,
                                  activeColor: kBlueLightColor,
                                  onChanged: (val) {
                                    setActivityLevel(val);
                                  },
                                ),
                                Flexible(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        'Moderately active (performs physical activities at least 5 times a week, such as jogging and weight lifting, for up to 1 hour a day).',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                  value: 3,
                                  groupValue: activityLevel,
                                  activeColor: kBlueLightColor,
                                  onChanged: (val) {
                                    setActivityLevel(val);
                                  },
                                ),
                                Flexible(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        'Very active (manual workers, performs intense physical activities for more than 1 hour a day).',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                  value: 4,
                                  groupValue: activityLevel,
                                  activeColor: kBlueLightColor,
                                  onChanged: (val) {
                                    setActivityLevel(val);
                                  },
                                ),
                                Flexible(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        'Athlete (practices high intensity physical sports for long periods of time).',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              RaisedButton(
                padding: const EdgeInsets.all(8),
                textColor: kTextColor,
                color: Colors.blue,
                elevation: 10.0,
                onPressed: () {},
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
