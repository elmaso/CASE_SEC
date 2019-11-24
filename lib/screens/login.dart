/// Pantalla que permite a los usuarios validarse
///
///

import 'package:des_case_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/constants.dart';
import '../shared/shared.dart';

class LoginScreen extends StatefulWidget {
  createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  AuthService auth = AuthService();

  @override
  void initState() {
    super.initState();
    // Revisamos si ya tenemos sesion para evitar login
    auth.getUser.then(
      (user) {
        if (user != null) {
          Navigator.pushReplacementNamed(context, '/valiacion');
        }
      },
    );
  }

  //TODO Mejorar la image y diseno general, cambiando la fotos por elementos nativos
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: <Widget>[
                Image.asset(seciniciodos),
                SizedBox(
                  height: 50.0,
                  width: 50.0,
                ),
              ],
            ),
            SizedBox(height: 3.0),
            Text(
              'Inicia sesión para comenzar',
              style: Theme.of(context).textTheme.headline,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40.0),
            LoginButton(
              text: 'LOGIN CON GOOGLE',
              icon: FontAwesomeIcons.google,
              color: Colors.black45,
              redirection: '/validacion',
              loginMethod: auth.googleSignIn,
            ),
          ],
        ),
      ),
    );
  }
}
