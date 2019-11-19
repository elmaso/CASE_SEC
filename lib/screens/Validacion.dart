import 'package:flutter/material.dart';
import 'package:des_case_app/resources/images.dart';
import 'package:des_case_app/services/auth.dart';
import 'package:des_case_app/services/models.dart';
import 'package:des_case_app/services/globals.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';



class ValidacionUsuario extends StatefulWidget {
  @override
  _ValidacionUsuarioState createState() => _ValidacionUsuarioState();
}

class _ValidacionUsuarioState extends State<ValidacionUsuario> {
  final 
  @override
  Widget build(BuildContext context) {
       return Scaffold(
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            children: <Widget>[
              SizedBox(height: 10.0),
              Column(
                children: <Widget>[
                  Image.asset(seclogo),
                  SizedBox(height: 100.0),
                  Text('Validación Socios Activos'),
                ],
              ),
              SizedBox(height: 30.0),
              //color
              TextField(
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
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Favor de Llenar Campo';
                  }
                  return null;
                }
              ),
              SizedBox(height: 20.0),
              FlatButton(
                textColor: Colors.white,
                color: Colors.teal,
                child: Text('VALIDAR'),
                onPressed: () {},
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
    }
}
