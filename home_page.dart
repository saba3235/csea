import 'package:flutter/material.dart';
import 'package:login/auth.dart';
import 'package:login/bbmain.dart';
import 'package:login/Calendarmain.dart';

class HomePage extends StatelessWidget{
  HomePage({this.auth, this.onSignOut});
  final BaseAuth auth;
  final VoidCallback onSignOut;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'A Astute World',

        home: HomePage1(auth: this.auth, onSignOut: this.onSignOut),
        routes: <String, WidgetBuilder>{

          "/b": (BuildContext context) => new GoogleCalendarEvents(),
          "/a": (BuildContext context) => new BBMyApp(),

        }
    );

        // TODO: implement build

  }
}
class HomePage1 extends StatelessWidget {
  HomePage1({this.auth, this.onSignOut});
  final BaseAuth auth;
  final VoidCallback onSignOut;

  @override
  Widget build(BuildContext context) {

    void _signOut() async {
      try {
        await auth.signOut();
        onSignOut();
      } catch (e) {
        print(e);
      }

    }

    return new Scaffold(
        appBar: new AppBar(
          actions: <Widget>[
            // ignore: deprecated_member_use
            new FlatButton(
                onPressed: _signOut,
                child: new Text('Logout', style: new TextStyle(fontSize: 17.0, color: Colors.white))
            )
          ],
        ),

        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[

              new ListTile(
                title: new Text("Scheduler"),
                trailing: new Icon(Icons.add_alert_sharp),
                onTap: ()=> Navigator.of(context).pushNamed("/b"),

              ),
              new ListTile(
                title: new Text("Digital Notice Board"),
                trailing: new Icon(Icons.add_alert_sharp),
                onTap: ()=> Navigator.of(context).pushNamed("/a"),

              ),


            ],
          ),
        ),

        body: new Center(
          child: new Text(
            'Welcome',
            style: new TextStyle(fontSize: 32.0),
          ),
        )
    );
  }
}