import 'package:des_case_app/services/db.dart';
import 'package:des_case_app/services/models.dart';
import 'package:des_case_app/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ValSocioForm1 extends StatefulWidget {
  @override
  _ValSocioForm1State createState() => _ValSocioForm1State();
}

class _ValSocioForm1State extends State<ValSocioForm1> {
  String numEmp, ssEmp, empdb;
  var numempleado = TextEditingController();
  var numss = TextEditingController();

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
                title: TextFormField(
                  onChanged: (value) {
                    numEmp = value;
                  },
                  controller: numempleado,
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
                  controller: numss,
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
                      numEmp = numempleado.text;
                      ssEmp = numss.text;
                      return showDialog(
                        context: context,
                        builder: (context) {
                          return SimpleDialog(
                              title: const Text('CASE'),
                              children: <Widget>[
                                SimpleDialogOption(
                                  child: Text('Número de Empleado:' + ' ' +
                                      numempleado.text,),
                                ),
                                SimpleDialogOption(
                                  child: Text('Número de Seguro Social:' + ' ' +
                                      numss.text,),
                                ),
                                SimpleDialogOption(
                                  child: Text(
                                    'Número de Empleado:' + ' ' + empdb,),
                                ),
                              ]
                          );
                        },
                      );
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void validaUser({numEmp}) {
    final emps = numEmp;
    FutureBuilder(
        future: Document<Empleado>(path: 'Empleados/$emps').getData(),
        // ignore: missing_return
        builder: (BuildContext context, AsyncSnapshot snap) {
          Empleado emp = snap.data;
          emp.num_ss = empdb;
        }
    );
  }
}
//void validaUser({numEmp}) {
//final emp = numEmp;
//print('entre a la funcion ' + numEmp);
//FutureBuilder(
///Segun yo deberia ir '/$idEmp' despues de Empleados no?
//  future: Document<Empleado>(path: 'Empleados/$emp').getData(),
//builder: (BuildContext context, AsyncSnapshot snap) {
//if (numEmp != emp) {} else {
//Scaffold(
//appBar: AppBar(
//backgroundColor: Colors.teal,
//title: Text('Hola'),
//),
//);
//}
//}
//);
