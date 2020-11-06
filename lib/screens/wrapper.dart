import 'package:app_good_caloric_burn/models/user.dart';
import 'package:app_good_caloric_burn/screens/auth/physical_data.dart';
import 'package:app_good_caloric_burn/screens/home/exercises_screen.dart';
import 'package:app_good_caloric_burn/widgets/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth/authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    if (user == null) {
      //return NavBar();
      return Authenticate();
    } else {
      return NavBar();
    }
  }
}
