import 'package:app_good_caloric_burn/common/appColors.dart';
import 'package:app_good_caloric_burn/common/const.dart';
import 'package:app_good_caloric_burn/common/loading.dart';
import 'package:app_good_caloric_burn/models/user.dart';
import 'package:app_good_caloric_burn/screens/auth/information_collect_screen.dart';
import 'package:app_good_caloric_burn/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String email = '';
  String password = '';
  String error = '';
  String name = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: kBackgroundColor,
            appBar: AppBar(
              backgroundColor: kBlueColor,
              elevation: 0.0,
              title: Text('Sign up'),
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.person),
                  label: Text('Sign in'),
                  onPressed: () => widget.toggleView(),
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration:
                              textInputDecoration.copyWith(hintText: 'Name'),
                          validator: (value) =>
                              value.isEmpty ? 'Enter a name' : null,
                          onChanged: (value) {
                            setState(() {
                              name = value;
                            });
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration:
                              textInputDecoration.copyWith(hintText: 'Email'),
                          validator: (val) =>
                              val.isEmpty ? 'Enter an Email' : null,
                          onChanged: (value) {
                            setState(() {
                              email = value;
                            });
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: textInputDecoration.copyWith(
                              hintText: 'Password'),
                          validator: (value) => value.length < 6
                              ? 'Enter a password with 6+ chars long'
                              : null,
                          obscureText: true,
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        RaisedButton(
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              /*setState(() {
                                loading = true;
                              });*/
                              UserModel userData = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => InitialForm()));
                              userData.nome = name;
                              dynamic result =
                                  await _auth.registerWithEmailAndPassword(
                                      email, password);
                              if (result == null) {
                                setState(() {
                                  error = 'please supply a valid email';
                                  loading = false;
                                });
                              }
                            }
                          },
                          color: Colors.blue,
                          child: Text('Register'),
                        ),
                        SizedBox(
                          height: 15,
                          child: Text(
                            error,
                            style: TextStyle(color: Colors.red, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          );
  }
}
