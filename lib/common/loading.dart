import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:app_good_caloric_burn/common/appColors.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      child: Center(
        child: SpinKitChasingDots(
          color: kActiveIconColor,
          size: 50.0,
        ),
      ),
    );
  }
}
