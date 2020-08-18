import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multiroomchat/chat/chat_generic.dart';
import 'package:url_launcher/url_launcher.dart';

import 'home_page.dart';

class Links extends StatefulWidget {
  LinksState createState() => LinksState();
}

class LinksState extends State<Links> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.fromLTRB(20, 60, 20, 60),
        children: <Widget>[
          RaisedButton(
            padding: const EdgeInsets.all(20),
            onPressed: () async {
              const url = 'https://www.popcornflix.com/pages/discover/d/movies';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
            child: Text(
              'PopCornFLIX',
              style:
                  DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.5),
            ),
            color: Colors.blue[900],
          ),
          Divider(),
          RaisedButton(
            padding: const EdgeInsets.all(20),
            onPressed: () async {
              const url = 'https://www.rottentomatoes.com/';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
            child: Text(
              'Rotten Tomatoes',
              style:
                  DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.5),
            ),
            color: Colors.red[900],
          ),
          Divider(),
          RaisedButton(
            padding: const EdgeInsets.all(20),
            onPressed: () async {
              const url = 'https://www.themoviedb.org/';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
            child: Text(
              'TMDB',
              style:
                  DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.5),
            ),
            color: Colors.green[900],
          ),
          Divider(),
          Divider(),
          Divider(),
          Divider(),
          RaisedButton(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            onPressed: () async {
//              await startChat();

              FirebaseUser user = await auth.signInWithEmailAndPassword(
                email: email,
                password: password,
              );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Chat(
                    user: user,
                    collection: 'messageauthor',
                    text: 'Send me a message',
                  ),
                ),
              );
            },
            child: Text(
              'Message the author of the APP',
              style: TextStyle(
                  color: Colors.black.withOpacity(0.9),
                  fontStyle: FontStyle.italic),
            ),
            color: Colors.blueGrey,
          ),
        ],
      ),
    );
  }
}
