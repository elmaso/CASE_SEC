import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/services.dart';

/// Control del estado para manejo de la forma
///
class ValidacionState with ChangeNotifier {
  String _idemp, _ssEmp;
  int _validado = 0;

  get idEmp => _idemp;

  get ssEmp => _ssEmp;

  get validado => _validado;

  set validdo(int newValue) {
    _validado = newValue;
    notifyListeners();
  }

  set idEmp(String newValue) {
    _idemp = newValue;
    notifyListeners();
  }

  set ssEmp(String newValue) {
    _ssEmp = newValue;
    notifyListeners();
  }
}

class ValidacionScreens extends StatefulWidget {
  @override
  _ValidacionScreensState createState() => _ValidacionScreensState();
}

class _ValidacionScreensState extends State<ValidacionScreens> {
  /// Permite llamar a esta clase con la variable del empleado
  _ValidacionScreensState({this.idEmp});

  final String idEmp;

  /// Pasa el usuario Friebase actual
  final AuthService auth = AuthService();

  ///Accesso al contenido de la base de Datos
  final db = Firestore.instance;
  final _formKey = GlobalKey<FormState>();

  ///Permite almacenar contenido de TextField
  var numempleado = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FirebaseUser user = Provider.of<FirebaseUser>(context);
    return ChangeNotifierProvider(
        builder: (_) => ValidacionState(),
        child: FutureBuilder(
          future: Document<Empleado>(path: 'Empleados/$idEmp').getData(),
          builder: (BuildContext context, AsyncSnapshot snap) {
            var state = Provider.of<ValidacionState>(context);

            if (!snap.hasData || snap.hasError) {
              return Scaffold(
                appBar: AppBar(
                  title: Text('ValSocio ' + user.displayName),
                ),
                body: Form(
                    key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              cursorColor: Colors.teal,

                              onSaved: (value) =>
                                  numempleado = value as TextEditingController,
                              cursorRadius: Radius.circular(14.0),
                              cursorWidth: 16.0,
                              decoration: InputDecoration(
                                  labelText: '# de Empleado',
                                  border: OutlineInputBorder()),

                              //onSaved: (input) => _idEmp = input,
                            ),
                          ),
                          Spacer(),
                          FlatButton(
                            onPressed: () {
                              if (numempleado.text != idEmp) {
                                Navigator.pushReplacementNamed(context, '/');
                              } else {
                                Text('Error 1');
                              }
                            },
                            textColor: Colors.white,
                            color: Colors.teal,
                            child: Text('VALIDAR'),
                          ),
                        ],
                      ),
                    )),
              );
            } else {
              Empleado empleado = snap.data;
              return Scaffold(
                appBar: AppBar(
                  title: Text(empleado.idEmp + ' = ' + user.displayName),
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
                            label: Text('Validado'),
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
        ));
  }

  Valida({String idEmp, String ssEmp}) {
    //ValidacionScreen(idEmp: idEmp, ssEmp: ssEmp);
    return null;
  }
}
