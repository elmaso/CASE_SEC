import 'package:des_case_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:des_case_app/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:des_case_app/services/services.dart';
import '../services/services.dart';



class PrestamosScreens extends StatefulWidget {
  createState() => PrestamosScreensState();
}


class PrestamosScreensState extends State<PrestamosScreens> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();


      @override
  Widget build(BuildContext context) {
    FirebaseUser user = Provider.of<FirebaseUser>(context);
    final AuthService auth = AuthService();
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
        decoration: BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: <Widget>[
                Text('Bienvenido + varnombres + varpaterno + varmaterno '),
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

