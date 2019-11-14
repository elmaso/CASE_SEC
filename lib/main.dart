import 'package:des_case_app/screens/Prestamos.dart';
import 'package:des_case_app/screens/Profile.dart';
import 'package:des_case_app/screens/Validacion.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:des_case_app/screens/LoginScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Firebase Analytics
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: FirebaseAnalytics()),
      ],

      // Named Routes
      routes: {
        '/': (context) => LoginScreen(),
        '/Validacion': (context) => ValidacionUsuario(),
        //'/case': (context) => CaseScreen(),
        //'/solicitud': (context) => SolicitudScreen(),
        //',/detalle': (context) => DetalleScreenn(),
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
    );
  }
}
