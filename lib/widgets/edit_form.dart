import 'package:app_good_caloric_burn/common/appColors.dart';
import 'package:app_good_caloric_burn/models/user.dart';
import 'package:app_good_caloric_burn/services/database.dart';
import 'package:flutter/material.dart';
import 'package:app_good_caloric_burn/common/const.dart';
import 'package:provider/provider.dart';

class EditForm extends StatefulWidget {
  @override
  _EditFormState createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  final _formKey = GlobalKey<FormState>();

  int _currentIdade;
  double _currentPeso;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    return SingleChildScrollView(
      child: StreamBuilder<UserModel>(
          stream: DatabaseService(uid: user.uid).userData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              UserModel userData = snapshot.data;
              String idade = userData.idade.toString();
              String peso = userData.peso.toStringAsFixed(2);

              return Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text(
                      "Update your info.",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      initialValue: userData.idade.toStringAsFixed(0),
                      decoration: textInputDecoration,
                      validator: (val) =>
                          val.isEmpty ? 'Please enter a value' : null,
                      onChanged: (val) =>
                          setState(() => _currentIdade = int.parse(val)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      initialValue: userData.peso.toStringAsFixed(2),
                      decoration: textInputDecoration,
                      validator: (val) =>
                          val.isEmpty ? 'Please enter a value' : null,
                      onChanged: (val) =>
                          setState(() => _currentPeso = double.parse(val)),
                    ),
                    RaisedButton(
                      color: kActiveIconColor,
                      child: Text(
                        'Update',
                        style: TextStyle(color: kTextColor),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          userData.idade = _currentIdade ?? userData.idade;
                          userData.peso = _currentPeso ?? userData.peso;
                          await DatabaseService(uid: user.uid)
                              .updateUserData(userData);
                          Navigator.pop(context);
                        }
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              );
            }
          }),
    );
  }
}
