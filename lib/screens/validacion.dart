import 'package:des_case_app/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:des_case_app/constants//images.dart';
import 'package:des_case_app/services/models.dart';
import 'package:des_case_app/services/globals.dart';
class ValidacionUsuario extends StatefulWidget {
  @override
  _ValidacionUsuarioState createState() => _ValidacionUsuarioState();
}

class _ValidacionUsuarioState extends State<ValidacionUsuario> {
  final numempleado = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Global.empleadoRef.getData(),
      builder: (BuildContext context, AsyncSnapshot snap) {
    if (snap.hasData){
    List<Empleado> empleados = snap.data;
    return Scaffold(
    body:
    SafeArea(
    child: ListView(
    padding: EdgeInsets.symmetric(horizontal: 24.0),
    children: <Widget>[
    SizedBox(height: 10.0),
    Column(
    children: <Widget>[
    Image.asset(seciniciodos),
    SizedBox(height: 10.0),
    Text('Validación Socios Activos',
    style: TextStyle(fontWeight: FontWeight.bold),),
    ],
    ),
    SizedBox(height: 10.0),
    //color
    TextField(
    controller: numempleado,
    cursorColor: Colors.teal,
    cursorRadius: Radius.circular(14.0),
    cursorWidth: 16.0,
    decoration: InputDecoration(
    labelText: '# de Empleado',
    border: OutlineInputBorder()
    ),
    ),
    SizedBox(height: 28.0),
    TextField(
    cursorColor: Colors.teal,
    cursorRadius: Radius.circular(14.0),
    cursorWidth: 16.0,
    decoration: InputDecoration(
    labelText: '# de SS',
    border: OutlineInputBorder()
    ),
    ),
    SizedBox(height: 20.0),
    FlatButton(
    textColor: Colors.white,
    color: Colors.teal,
    child: Text('VALIDAR'),
    onPressed: () {
    if numempleado = empleados.map((empleado) => Empleado(empleado: id)).toList(),
    else
      
    }
    ),
    Column(
    children: <Widget>[
    SizedBox(height: 30.0),
    Text('CAET',
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
    ),
    ],
    ),
    ],
    ),
    ),
    );
    } else {
    return LoginScreen();
    }
    },
    }
  }
