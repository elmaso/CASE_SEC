import 'package:des_case_app/constants//images.dart';
import 'package:des_case_app/services/db.dart';
import 'package:des_case_app/services/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ValidacionUsuarioState with ChangeNotifier {
  int _validado = 0;
  int _intentos = 0;

  final PageController controller = PageController();

  get validado => _validado;

  get intentos => _intentos;

  set validado(int newValue) {
    _validado = newValue;
    notifyListeners();
  }

  set intentos(int newValue) {
    _intentos = newValue;
    notifyListeners();
  }

  void nextPage() async {
    await controller.nextPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}

class ValidacionUsuario extends StatelessWidget {
  ValidacionUsuario({this.empleadoId});

  final String empleadoId;
  final numempleado = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (_) => ValidacionUsuarioState(),
      child: FutureBuilder(
          future: Document<Empleado>(path: 'Empleados/$empleadoId').getData(),
          builder: (BuildContext context, AsyncSnapshot snap) {
            var state = Provider.of<ValidacionUsuarioState>(context);

            if (!snap.hasData || snap.hasError) {
              return SafeArea(
                  child: ListView(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      children: <Widget>[
                    SizedBox(height: 10.0),
                    Column(
                      children: <Widget>[
                        Image.asset(seciniciodos),
                        SizedBox(height: 10.0),
                        Text(
                          'Validación Socios Activos',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
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
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(height: 28.0),
                    PageView.builder(
                      controller: state.controller,
                    ),
                    TextField(
                      controller: numempleado,
                      cursorColor: Colors.teal,
                      cursorRadius: Radius.circular(14.0),
                      cursorWidth: 16.0,
                      decoration: InputDecoration(
                          labelText: '# de Empleado',
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(height: 28.0),
                    TextField(
                      cursorColor: Colors.teal,
                      cursorRadius: Radius.circular(14.0),
                      cursorWidth: 16.0,
                      decoration: InputDecoration(
                          labelText: '# de SS', border: OutlineInputBorder()),
                    ),
                    SizedBox(height: 20.0),
                  ]));
            } else {
              Empleado empleado = snap.data;
              return SafeArea(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  children: <Widget>[
                    SizedBox(height: 10.0),
                    Column(
                      children: <Widget>[
                        Image.asset(seciniciodos),
                        SizedBox(height: 10.0),
                        Text(
                          'Validación Socios Activos',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
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
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(height: 28.0),
                    PageView.builder(
                      controller: state.controller,
                    ),
                    TextField(
                      controller: numempleado,
                      cursorColor: Colors.teal,
                      cursorRadius: Radius.circular(14.0),
                      cursorWidth: 16.0,
                      decoration: InputDecoration(
                          labelText: '# de Empleado',
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(height: 28.0),
                    TextField(
                      cursorColor: Colors.teal,
                      cursorRadius: Radius.circular(14.0),
                      cursorWidth: 16.0,
                      decoration: InputDecoration(
                          labelText: '# de SS', border: OutlineInputBorder()),
                    ),
                    SizedBox(height: 20.0),
                  ],
                ),
              );
            }
          }),
    );
  }
}
