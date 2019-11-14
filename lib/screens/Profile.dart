import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/services.dart';
import '../shared/shared.dart';
import 'package:provider/provider.dart';
import 'package:des_case_app/services/auth.dart';
import 'package:des_case_app/shared/loader.dart';
import 'package:des_case_app/services/models.dart';

class ProfileScreen extends StatelessWidget {
  final AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    Socio report = Provider.of<Socio>(context);
    FirebaseUser user = Provider.of<FirebaseUser>(context);

    if (user != null) {

      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text(user.displayName ?? 'Guest'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (user.photoUrl != null)
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.only(top: 50),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(user.photoUrl),
                    ),
                  ),
                ),
              Text(user.email ?? '', style: Theme.of(context).textTheme.headline),
              Spacer(),
              Spacer(),
              FlatButton(
                  child: Text('logout'),
                  color: Colors.red,
                  onPressed: () async {
                    await auth.signOut();
                    Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
                  }),
              Spacer()
            ],
          ),
        ),
      );
    } else {
      return LoadingScreen();
    }
  }

}