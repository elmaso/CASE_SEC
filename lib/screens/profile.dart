import 'package:des_case_app/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../services/services.dart';
import '../shared/shared.dart';

class PerfilState with ChangeNotifier {
  int _validado = 0;
  String _idemp = '25140306';
  String _ss;
  int _intentos = 0;

  get validado => _validado;
  //get idemp => _idemp;
  get ss => _ss;
  get intentos => _intentos;

  set validado(int newValue) {
    _validado = newValue;
    notifyListeners();
  }

  set idemp(String newValue) {
    _idemp = newValue;
    notifyListeners();
  }

  set ss(String newValue) {
    _ss = newValue;
    notifyListeners();
  }

  set intentos(int newValue) {
    _intentos = newValue;
    notifyListeners();
  }
}

class ProfileScreen extends StatelessWidget {
  ProfileScreen({this.empleado});
  final String empleado;

  @override
  Widget build(BuildContext context) {
    String _emp, _ssEmp;
    return ChangeNotifierProvider(
      builder: (_) => PerfilState(),
      child: FutureBuilder(
        future: Document<Empleado>(path: 'Empleados/$empleado').getData(),
        builder: (BuildContext context, AsyncSnapshot snap) {
          // var state = Provider.of<Empleado>(context);

          if (snap.hasError || !snap.hasData) {
            return Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Column(
                    children: <Widget>[
                      Text('Esto seria parte del UI'),
                      ListTile(
                        title: TextField(
                          onChanged: (value) {
                            _emp = value;
                          },
                          decoration: InputDecoration(
                              icon: Icon(Icons.assignment_ind),
                              labelText: 'Número de Empleado',
                              hintText: '25100000',
                              labelStyle:
                                  TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                      ListTile(
                        title: TextField(
                          onChanged: (value) {
                            _ssEmp = value;
                          },
                          decoration: InputDecoration(
                              icon: Icon(Icons.lock),
                              labelText: 'Número de Seguro Social',
                              labelStyle:
                                  TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                      ListTile(
                        title: RaisedButton(
                            child: Text('Validar'),
                            onPressed: () {
                              print(_emp);
                              print(_ssEmp);
                              print("ya mero");
                            }),
                      )
                    ],
                  ),
                ),
              ),
            );
          } else {
            Empleado empleado = snap.data;
            return Scaffold(
              appBar: AppBar(
                title: Text(empleado.idEmp),
              ),
              // body: MiPerfil(),
            );
          }
        },
      ),
    );
  }
}

class MiPerfil extends StatelessWidget {
  final AuthService auth = AuthService();
  final Empleado empleado;
  MiPerfil({this.empleado});

  @override
  Widget build(BuildContext context) {
    FirebaseUser user = Provider.of<FirebaseUser>(context);
    var state = Provider.of<Empleado>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(user.uid ?? 'Guest'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
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
            Text(user.email ?? '', style: Theme.of(context).textTheme.headline),
            Text(
              user.displayName ?? '',
              style: Theme.of(context).textTheme.body1,
            ),
            Spacer(),
            Text(
              state.idEmp,
              style: Theme.of(context).textTheme.body1,
            ),
            Spacer(),
            Spacer(),
            LoginButton(
              text: 'logout',
              icon: FontAwesomeIcons.signOutAlt,
              color: Colors.black45,
              redirection: '/',
              //loginMethod: auth.signOut(),
            ),
            FlatButton(
                child: Text('logout'),
                color: Colors.red,
                onPressed: () async {
                  await auth.signOut();
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/', (route) => false);
                }),
            Spacer()
          ],
        ),
      ),
    );
  }
}
