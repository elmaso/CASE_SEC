import 'package:des_case_app/services/auth.dart';
import 'package:des_case_app/services/models.dart';
import 'package:flutter/material.dart';
import 'package:des_case_app/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:des_case_app/services/services.dart';



class PrestamosScreen extends StatefulWidget {
  createState() => PrestamosScreenState();
}

class PrestamosScreenState extends State<PrestamosScreen> {
  @override
  Widget build(BuildContext context) {
    FirebaseUser user = Provider.of<FirebaseUser>(context);
    final AuthService auth = AuthService();
    final scaffoldKey = new GlobalKey<ScaffoldState>();
    final formKey = new GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text((user.email)),
        leading: IconButton(
            icon: Icon(FontAwesomeIcons.home),
            onPressed: () async {
              await auth.signOut();
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/', (route) => false);
            }),
      ),
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
              'Prestamos',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline,
              textAlign: TextAlign.center,
            ),
            Text(
              (user.uid),
              style: Theme
                  .of(context)
                  .textTheme
                  .headline,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}