import 'package:app_good_caloric_burn/common/appColors.dart';
import 'package:app_good_caloric_burn/services/auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _auth = AuthService();
  @override
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "Welcome, Elton\n",
                          style: Theme.of(context)
                              .textTheme
                              .display1
                              .copyWith(fontWeight: FontWeight.w800),
                        ),
                        IconButton(
                          alignment: Alignment.topRight,
                          onPressed: () async {
                            await _auth.signOut();
                          },
                          icon: Icon(Icons.exit_to_app),
                          iconSize: 20.0,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              "0",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              "Trainings",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              "0.0",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              "Kcal",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              "0",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              "Minutes",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.topCenter,
                              child: Image(
                                image: AssetImage(
                                    'assets/images/last_exercise.jpg'),
                                height: 175,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vitae enim vulputate, tempus leo nec, fermentum tellus. Etiam auctor erat quis turpis elementum, id posuere nisi volutpat. Aenean venenatis, lectus vitae feugiat congue, tellus odio faucibus elit, a finibus justo magna placerat tortor.",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ]),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
