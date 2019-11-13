import 'services.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:des_case_app/services/models.dart';


/// Static global state. Immutable services that do not care about build context.
class Global {
  // App Data
  static final String title = 'Fireship';

  // Services
  static final FirebaseAnalytics analytics = FirebaseAnalytics();

  // Data Models
  static final Map models = {
    Empleado: (data) => Empleado.fromMap(data),
    Socio: (data) => Socio.fromMap(data),
  };

  // Firestore References for Writes
  static final Collection<Empleado> empleadoRef = Collection<Empleado>(path: 'Empleados');
  static final UserData<Socio> socioRef = UserData<Socio>(collection: 'SocioCase');


}