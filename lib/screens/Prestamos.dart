import 'package:des_case_app/services/models.dart';
import 'package:flutter/material.dart';
import '../services/services.dart';
import '../shared/shared.dart';
import '../screens/screens.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:des_case_app/services/globals.dart';
import 'package:des_case_app/shared/loader.dart';
import 'package:des_case_app/services/models.dart';

class TopicsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Global.empleadoRef.getData(),
      builder: (BuildContext context, AsyncSnapshot snap) {
        if (snap.hasData) {
          List<Empleado> topics = snap.data;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepPurple,
              title: Text('Prestamos'),
              actions: [
                IconButton(
                  icon: Icon(FontAwesomeIcons.userCircle,
                      color: Colors.pink[200]),
                  onPressed: () => Navigator.pushNamed(context, '/Profile'),
                )
              ],
            ),
            body: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20.0),
              crossAxisSpacing: 10.0,
              crossAxisCount: 2,
              children: topics.map((topic) => TopicItem(topic: topic)).toList(),
            ),
          );
        } else {
          return LoadingScreen();
        }
      },
    );
  }
}

class TopicItem extends StatelessWidget {
  final Empleado topic;
  const TopicItem({Key key, this.topic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Hero(
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => TopicScreen(topic: topic),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          topic.nombres,
                          style: TextStyle(
                              height: 1.5, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.fade,
                          softWrap: false,
                        ),
                      ),
                    ),
                    // Text(topic.description)
                  ],
                ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TopicScreen extends StatelessWidget {
  final Empleado topic;

  TopicScreen({this.topic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: ListView(children: [
        Text(
          topic.nombres,
          style:
          TextStyle(height: 2, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ]),
    );
  }
}