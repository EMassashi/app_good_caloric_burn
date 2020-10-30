import 'package:app_good_caloric_burn/common/appColors.dart';
import 'package:app_good_caloric_burn/screens/exercises_screen.dart';
import 'package:app_good_caloric_burn/screens/home_page_screen.dart';
import 'package:app_good_caloric_burn/screens/today_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentTab = 1;
  final List<Widget> screens = [
    TodayScreen(),
    HomePage(),
    ExercisesScreen(),
  ];

  Widget currentScreen = HomePage();

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: size.height * .1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(
                        () {
                          currentScreen = TodayScreen();
                          currentTab = 0;
                        },
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SvgPicture.asset(
                          "assets/icons/calendar.svg",
                          height: 30,
                          color:
                              currentTab == 0 ? kActiveIconColor : kTextColor,
                        ),
                        Text(
                          'Today',
                          style: TextStyle(
                              color: currentTab == 0
                                  ? kActiveIconColor
                                  : kTextColor),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: size.width * .15,
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(
                        () {
                          currentScreen = HomePage();
                          currentTab = 1;
                        },
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SvgPicture.asset(
                          "assets/icons/home.svg",
                          height: 34,
                          color:
                              currentTab == 1 ? kActiveIconColor : kTextColor,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                            color:
                                currentTab == 1 ? kActiveIconColor : kTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: size.width * .15,
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(
                        () {
                          currentScreen = ExercisesScreen();
                          currentTab = 2;
                        },
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SvgPicture.asset(
                          "assets/icons/dumbell.svg",
                          height: 35,
                          color:
                              currentTab == 2 ? kActiveIconColor : kTextColor,
                        ),
                        Text(
                          'Exercises',
                          style: TextStyle(
                              color: currentTab == 2
                                  ? kActiveIconColor
                                  : kTextColor),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
