import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Firebase Analytics
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: FirebaseAnalytics()),
      ],

      // Named Routes
      routes: {
        '/': (context) => LoginScreen(),
        '/perfil': (context) => PerfilScreen(),
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
        brightness: Brightness.dark,
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
