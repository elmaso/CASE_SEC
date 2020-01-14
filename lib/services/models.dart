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
  String prestamos;

  Empleado(
      {this.idEmp,
        this.nivel,
      this.nombres,

      this.paterno,
      this.materno,
        this.prestamos,
        this.num_ss,});

  factory Empleado.fromMap(Map data) {
    return Empleado(
      idEmp: data['id'] ?? '',
      materno: data['materno'] ?? '',
      nivel: data['nivel'] ?? '',
      nombres: data['nombres'] ?? '',

      paterno: data['paterno'] ?? '',
      prestamos: data['prestamo'] ?? '',
      num_ss: data['num_ss'] ?? '',
    );
  }
}

class Socio {
  String uid;
  dynamic ultimaVisita;
  String materno;
  String nivel;
  String nombres;
  String idEmp;
  String paterno;
  String num_ss;
  dynamic prestamo;
  List<Prestamo> socio;

  Socio({this.uid, this.ultimaVisita, this.socio, this.idEmp,
    this.nivel,
    this.nombres,

    this.paterno,
    this.materno,
    this.num_ss,
  this.prestamo});

  factory Socio.fromMap(Map data) {
    return Socio(
      uid: data['uid'],
      ultimaVisita: data['ultimavisita'],
      idEmp: data['id'] ?? '',
      materno: data['materno'] ?? '',
      nivel: data['nivel'] ?? '',
      nombres: data['nombres'] ?? '',

      paterno: data['paterno'] ?? '',
      num_ss: data['num_ss'] ?? '',
      prestamo: data['prestamo'] ?? '',
    );
  }
}
