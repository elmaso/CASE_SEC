import 'package:des_case_app/screens/profile.dart';
import 'package:des_case_app/screens/validacion2.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/screens.dart';
import 'services/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<Socio>.value(value: Global.socioRef.documentStream),
        StreamProvider<FirebaseUser>.value(value: AuthService().user),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // Firebase Analytics
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: FirebaseAnalytics()),
        ],

        // Named Routes
        routes: {
          '/': (context) => LoginScreen(),
          '/validacion': (context) => ValidacionUsuario(),
          //'/prestamos': (context) => PrestamosScreen(),
          //'/solicitud': (context) => SolicitudScreen(),
          //',/detalle': (context) => DetalleScreenn(),
          '/perfil': (context) => ProfileScreen(),
          '/perfil2': (context) => ValidacionScreen(),
        },

        // Theme
        theme: ThemeData(
          fontFamily: 'Nunito',
          bottomAppBarTheme: BottomAppBarTheme(
            color: Colors.black87,
          ),
          brightness: Brightness.light,
          textTheme: TextTheme(
            body1: TextStyle(fontSize: 18),
            body2: TextStyle(fontSize: 16),
            button: TextStyle(letterSpacing: 1.5, fontWeight: FontWeight.bold),
            headline: TextStyle(fontWeight: FontWeight.bold),
            subhead: TextStyle(color: Colors.grey),
          ),
          buttonTheme: ButtonThemeData(),
        ),
      ),
    );
  }
}
