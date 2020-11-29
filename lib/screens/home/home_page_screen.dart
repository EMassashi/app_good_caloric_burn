import 'package:app_good_caloric_burn/common/appColors.dart';
import 'package:app_good_caloric_burn/models/user.dart';
import 'package:app_good_caloric_burn/services/auth.dart';
import 'package:app_good_caloric_burn/services/database.dart';
import 'package:app_good_caloric_burn/widgets/edit_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_good_caloric_burn/common/loading.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              color: kBackgroundColor,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
              child: EditForm(),
            );
          });
    }

    final user = Provider.of<UserModel>(context);
    var size = MediaQuery.of(context).size;
    return StreamBuilder<UserModel>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserModel userData = snapshot.data;
          String nome = userData.nome;
          String treinos = userData.treinos.toStringAsFixed(0);
          String kcal = userData.kcal.toStringAsFixed(2);
          String time = userData.time.toStringAsFixed(1);
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
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              IconButton(
                                onPressed: () => _showSettingsPanel(),
                                icon: Icon(Icons.settings),
                                iconSize: 20,
                                alignment: Alignment.topLeft,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Welcome",
                                    style: Theme.of(context)
                                        .textTheme
                                        .display1
                                        .copyWith(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w800),
                                  ),
                                  Text(
                                    "$nome",
                                    style: Theme.of(context)
                                        .textTheme
                                        .display1
                                        .copyWith(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w800),
                                  ),
                                ],
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
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(
                                    treinos,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(
                                    kcal,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(
                                    time,
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
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    alignment: Alignment.topCenter,
                                    child: Image(
                                      image: AssetImage(
                                          'assets/images/home_image.png'),
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
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Loading();
        }
      },
    );
  }
}
