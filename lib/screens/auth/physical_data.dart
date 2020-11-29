import 'package:app_good_caloric_burn/common/appColors.dart';
import 'package:app_good_caloric_burn/common/const.dart';
import 'package:app_good_caloric_burn/models/user.dart';
import 'package:flutter/material.dart';

class PhysicalData extends StatefulWidget {
  @override
  _PhysicalDataState createState() => _PhysicalDataState();
}

class _PhysicalDataState extends State<PhysicalData> {
  int altura;
  int idade;
  double peso;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kTextColor,
        title: Text('Physical info'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Form(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(
                          hintText: 'Height (in CM)'),
                      validator: (value) =>
                          value.length < 6 ? 'Enter a height' : null,
                      onChanged: (value) {
                        setState(() {
                          altura = int.parse(value);
                        });
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(
                          hintText: 'Weight (in KG)'),
                      validator: (value) =>
                          value.length < 6 ? 'Enter a weight' : null,
                      onChanged: (value) {
                        setState(() {
                          peso = double.parse(value);
                        });
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(
                          hintText: 'Age (in Years)'),
                      validator: (value) =>
                          value.length < 6 ? 'Enter an age' : null,
                      onChanged: (value) {
                        setState(() {
                          idade = int.parse(value);
                        });
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      padding: const EdgeInsets.all(8),
                      textColor: kTextColor,
                      color: kActiveIconColor,
                      elevation: 10.0,
                      onPressed: () {
                        UserModel userData =
                            UserModel(altura: altura, idade: idade, peso: peso);
                        Navigator.pop(context, userData);
                      },
                      child: Text('Save'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
