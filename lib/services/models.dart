//// Embedded Maps
class Prestamo {
  String id;
}

class Empleado {
  String materno;
  String nivel;
  String nombres;
  String idEmp;
  String paterno;
  String num_ss;

  Empleado(
      {this.idEmp,
        this.nivel,
      this.nombres,

      this.paterno,
      this.materno,
      this.num_ss});

  factory Empleado.fromMap(Map data) {
    return Empleado(
      idEmp: data['id'] ?? '',
      materno: data['materno'] ?? '',
      nivel: data['nivel'] ?? '',
      nombres: data['nombres'] ?? '',

      paterno: data['paterno'] ?? '',
      num_ss: data['num_ss'] ?? '',
    );
  }
}

class Socio {
  String uid;
  dynamic ultimaVisita;
  List<Prestamo> socio;

  Socio({this.uid, this.ultimaVisita, this.socio});

  factory Socio.fromMap(Map data) {
    return Socio(
      uid: data['uid'],
      ultimaVisita: data['ultimavisita'],
    );
  }
}
