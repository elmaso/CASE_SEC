import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/screens.dart';
import '../services/services.dart';

class ValidacionScreen extends StatelessWidget {
  final AuthService auth = AuthService();
  //final Empleado empleado;
  //ValidacionScreen({this.idEmp})
  //final String idEmp;

  @override
  Widget build(BuildContext context) {
    Empleado empleado = Provider.of<Empleado>(context);
    FirebaseUser user = Provider.of<FirebaseUser>(context);
    return FutureBuilder(
      future: Document<Empleado>(path: 'Empleados/25140306').getData(),
      builder: (BuildContext context, AsyncSnapshot snap) {
        //var state = Provider.of<Empleado>(context);

        if (!snap.hasData || snap.hasError) {
          return AboutScreen();
        } else {
          Empleado empleado = snap.data;
          return Scaffold(
            appBar: AppBar(
              title: Text(empleado.id),
            ),
            body: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (user.photoUrl != null)
                    Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(top: 50),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(user.photoUrl),
                        ),
                      ),
                    ),
                  Text(empleado.num_ss,
                      style: Theme.of(context).textTheme.headline),
                  Divider(),
                  Expanded(child: Text(empleado.nivel)),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton.icon(
                        onPressed: null,
                        label: Text('Start Quiz!'),
                        icon: Icon(Icons.poll),
                        color: Colors.green,
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
