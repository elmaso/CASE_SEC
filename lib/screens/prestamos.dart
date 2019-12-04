import 'package:flutter/material.dart';
import 'package:des_case_app/constants/constants.dart';


class PrestamosScreen extends StatefulWidget {
  createState() => PrestamosScreenState();
}

class PrestamosScreenState extends State<PrestamosScreen> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: <Widget>[
                Image.asset(seciniciodos),
                SizedBox(
                  height: 50.0,
                  width: 50.0,
                ),
              ],
            ),
            SizedBox(height: 3.0),
            Text(
              'Prestamos',
              style: Theme.of(context).textTheme.headline,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}