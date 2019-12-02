import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/services.dart';

class ValSocioForm extends StatefulWidget {
  @override
  _ValSocioFormState createState() => _ValSocioFormState();
}

class _ValSocioFormState extends State<ValSocioForm> {
  //Llaves de la forma y la vista
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  String _numEmp, _ssEmp;

  _ValSocioFormState();

  // Manejamos el estado de la forma
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // Siempre hay que eliminar elementos para evitar fugas de memoria
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  // Manejo de validacion de la forma
  void _submit() async {
    final form = formKey.currentState;
    //final Firestore _db = Firestore.instance;

    if (form.validate()) {
      //Pasaron las valicaiones basiscas
      print('vamos por  Empleados/$_numEmp');

      final snap =
          await Document<Empleado>(path: 'Empleados/$_numEmp').getData();

      print(snap.num_ss);
      validaSocio(_ssEmp == snap.num_ss.toString());
    }
  }

  void validaSocio(_ok) {
    final snackbar = new SnackBar(
      content: new Text(
          "empleado : $_numEmp, seguro social : $_ssEmp  se encontro: $_ok"),
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    FirebaseUser user = Provider.of<FirebaseUser>(context);
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Form(
              key: formKey,
              child: Flex(
                direction: Axis.vertical,
                children: <Widget>[
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
                  Text(user.displayName),
                  ListTile(
                    title: TextFormField(
                      onChanged: (value) {
                        _numEmp = value;
                      },
                      decoration: InputDecoration(
                          icon: Icon(Icons.assignment_ind),
                          labelText: 'Número de Empleado',
                          hintText: 'Utiliza el formato completo',
                          labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                      validator: (val) => val.substring(0, 3) != '251'
                          ? 'No es un numero Empleado valido'
                          : null,
                    ),
                  ),
                  ListTile(
                    title: TextFormField(
                      onChanged: (value) {
                        _ssEmp = value;
                      },
                      decoration: InputDecoration(
                          icon: Icon(Icons.lock),
                          labelText: 'Número de Seguro Social',
                          labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                      validator: (val) =>
                          val.length < 6 ? 'No es un numero valido' : null,
                    ),
                  ),
                  ListTile(
                    title: RaisedButton(
                      child: Text('Validar'),
                      onPressed: _submit,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  return null;
}
