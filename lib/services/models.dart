//// Embedded Maps

class Empleado {
  String materno;
  String nivel;
  String nombres;
  dynamic id;
  String paterno;
  dynamic num_ss;


  Empleado({ this.materno, this.nivel, this.nombres, this.id, this.paterno, this.num_ss });
  Empleado.fromMap(Map data) {
    materno = data['value'];
    nivel = data['detail'] ?? '';
    nombres = data['correct'];
    id = data['id'];
    paterno = data[id];
    num_ss = data [id];
  }
}





class Socio {
  String uid;
  dynamic ultimaVisita;


  Socio({ this.uid, this.ultimaVisita,});

  factory Socio.fromMap(Map data) {
    return Socio (
      uid: data['uid'],
      ultimaVisita: data['ultimavisita'],
    );
  }

}
