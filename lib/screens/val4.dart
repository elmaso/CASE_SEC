import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/services.dart';

class ValSocioForm extends StatefulWidget {
  @override
  _ValSocioFormState createState() => _ValSocioFormState();
}

class _ValSocioFormState extends State<ValSocioForm> {
  String numEmp, ssEmp;

  @override
  Widget build(BuildContext context) {
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
                    numEmp = value;
                  },
                  decoration: InputDecoration(
                      icon: Icon(Icons.assignment_ind),
                      labelText: 'Número de Empleado',
                      hintText: '25100000',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              ListTile(
                title: TextField(
                  onChanged: (value) {
                    ssEmp = value;
                  },
                  decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      labelText: 'Número de Seguro Social',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              ListTile(
                title: RaisedButton(
                    child: Text('Validar'),
                    onPressed: () {
                      print(numEmp);
                      print(ssEmp);
                      validaUser(
                        numEmp: numEmp,
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void validaUser({numEmp}) {
  final emp = numEmp;
  print('entre a la funcion ' + numEmp);

  FutureBuilder(
      future: Document<Empleado>(path: 'Empleados/$emp').getData(),
      builder: (BuildContext context, AsyncSnapshot snap) {
        Empleado empleado = snap.data;
        print(empleado.num_ss);
        print("hola");
        return;
      });
}
