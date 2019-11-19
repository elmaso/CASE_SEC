//// Embedded Maps

class Empleado {
  String materno;
  String nivel;
  String nombres;
  dynamic id;
  String paterno;
  dynamic num_ss;
  List<Empleado> empleado;

  Empleado(
      {this.materno,
      this.empleado,
      this.nivel,
      this.nombres,
      this.id,
      this.paterno,
      this.num_ss});

  factory Empleado.fromMap(Map data) {
    return Empleado(
        materno: data['materno'] ?? '',
        nivel: data['nivel'] ?? '',
        nombres: data['nombres'] ?? '',
        id: data['id'] ?? '',
        paterno: data['paterno'] ?? '',
        num_ss: data['num_ss'] ?? '',
        empleado: (data['empleado'] as List ?? [])
            .map((v) => Empleado.fromMap(v))
            .toList());
  }
}

class Socio {
  String uid;
  dynamic ultimaVisita;
  List<Socio> socio;

  Socio({this.uid, this.ultimaVisita, this.socio});

  factory Socio.fromMap(Map data) {
    return Socio(
        uid: data['uid'],
        ultimaVisita: data['ultimavisita'],
        socio: (data['socio'] as List ?? [])
            .map((v) => Socio.fromMap(v))
            .toList());
  }
}
