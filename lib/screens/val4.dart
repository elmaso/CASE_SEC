import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:des_case_app/constants/images.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../services/services.dart';
import 'package:des_case_app/services/services.dart';
import 'package:des_case_app/services/globals.dart';



class ValSocioForm extends StatefulWidget {

  final Empleado empleado;
  ValSocioForm({this.empleado});
  @override
  _ValSocioFormState createState() => _ValSocioFormState();

}

class _ValSocioFormState extends State<ValSocioForm> {
  //Llaves de la forma y la vista
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();



  String _numEmp, _ssEmp;
  int intentos;
  String okok;
  String uiduid;
  String varmaterno;
  String varnivel;
  String varnombres;
  String varidEmp;
  String varpaterno;
  String varnum_ss;
  String uidvar;
  String valsocio;

  var id;

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
      //Pasarón las valicaiones basiscas
      print('vamos por  Empleados/$_numEmp');
      final snap = await Document<Empleado>(path: 'Empleados/$_numEmp')
          .getData();
      FirebaseUser user = Provider.of<FirebaseUser>(context);
      print(snap.num_ss);
      print(snap.idEmp);
      print(user.email);
      varmaterno = snap.materno.toString();
      varnivel = snap.nivel.toString();
      varnombres = snap.nombres.toString();
      varidEmp = snap.idEmp.toString();
      varpaterno = snap.paterno.toString();
      varnum_ss = snap.num_ss.toString();
      validaSocio(_ssEmp == snap.num_ss.toString());
      if (_ssEmp == snap.num_ss.toString()) {
        Navigator.pushReplacementNamed(context, '/confirmaciones');
        getUserByEmail();
      }
    }
    }

 

  Future<void> _updateUserReport(Empleado empleado) {
    return Global.socioRef.upsert(
      ({
        'id': varidEmp,
        'SocioCase': {
          '${empleado.num_ss}': FieldValue.arrayUnion([empleado.idEmp])
        }
      }),
    );
  }




  void validaSocio(_ok) {
    final snackbar = new SnackBar(
      content: new Text(
          "empleado : $_numEmp, seguro social : $_ssEmp  se encontro: $_ok"),
      duration: Duration(seconds: 3),
    );
    scaffoldKey.currentState.showSnackBar(snackbar);

  }

   @override
  Widget build(BuildContext context) {
    FirebaseUser user = Provider.of<FirebaseUser>(context);
    uiduid = user.uid;
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
                  Text(user.email),
                  ListTile(
                    title: TextFormField(
                      onChanged: (value) {
                        _numEmp = value;
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.assignment_ind),
                          labelText: 'Número de Empleado',
                          hintText: 'Utiliza el formato completo',
                          helperText: 'Recuerda utilizar el 251',
                          labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                      keyboardType: TextInputType.number,
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
                          prefixIcon: Icon(Icons.lock),
                          labelText: 'Número de Seguro Social',
                          labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                      keyboardType: TextInputType.number,
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
class Confirmacion extends StatefulWidget {
  createState() => ConfirmacionState();
}

class ConfirmacionState extends State<Confirmacion> {



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
            SizedBox(height: 3.0),
            Text(
              'INFORMACION VALIDADA CORRECTAMENTE',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline,
              textAlign: TextAlign.center,
            ),
            Text('Numero de Empleado: ' ,
              style: Theme
                  .of(context)
                  .textTheme
                  .headline,
              textAlign: TextAlign.center,
            ),
            Text(user.uid,
              style: Theme
                  .of(context)
                  .textTheme
                  .headline,
              textAlign: TextAlign.center,
            ),
            RaisedButton(
              child: Text('Confirmar'),
              onPressed: (){},
                ),
    ],
        ),
    ),
    );
  }}



