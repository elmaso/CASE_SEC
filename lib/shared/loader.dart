import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 250,
      child: CircularProgressIndicator(),
    );
  }
}

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Loader(),
      ),
    );
  }
}

/// Este [Widget] permite parametrizar la forma de hacer login
///
/// Recibe Color, Icono, Texto y la Funcion a ejecutar
///
class LoginButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  final String redirection;
  final Function loginMethod;

  const LoginButton(
      {Key key,
      this.text,
      this.icon,
      this.color,
      this.loginMethod,
      this.redirection})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: FlatButton.icon(
        padding: EdgeInsets.all(30),
        icon: Icon(icon, color: Colors.white),
        color: color,
        onPressed: () async {
          var user = await loginMethod();
          if (user != null) {
            Navigator.pushReplacementNamed(context, '$redirection');
          }
        },
        label: Expanded(
          child: Text('$text', textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
