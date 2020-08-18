import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multiroomchat/chat/chat_generic.dart';

import 'home_page.dart';

class BestOf extends StatefulWidget {
  BestOfState createState() => BestOfState();
}

class BestOfState extends State<BestOf> {
  static String title01 = 'Avengers: Endgame';
  static String title02 = 'US';
  static String title03 = 'TOY STORY 4';
  static String title04 = 'KNIVES OUT';
  static String title05 = 'BOOKSMART';
  static String title06 = 'The Farewell';
  static String title07 = 'Spider-Man: Far From Home';
  static String title08 = 'Once Upon a Time In Hollywood';
  static String title09 = 'SHAZAM!';
  static String title10 = 'LITTLE WOMEN';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            color: Colors.grey[250],
            width: MediaQuery.of(context).size.width,
            height: 20.0,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                'Select a discussion group',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://resizing.flixster.com/-cutYuK3iVlyVVMkk9RewvA_PUU=/180x267/v1.bTsxMzAxOTkzMjtqOzE4NTQ3OzIwNDg7MTY4ODsyNTAw'),
            ),
            title: Text(title01),
            subtitle: Text('#1'),
            onTap: () async {
              FirebaseUser user = await auth.signInWithEmailAndPassword(
                email: email,
                password: password,
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Chat(
                    user: user,
                    collection: 'bestof01',
                    text: title01,
                  ),
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://resizing.flixster.com/z5KHVUGaoDLyoXs5MjDxRu5rIJU=/171x270/v1.bTsxMzAyNTI3OTtqOzE4NTM5OzIwNDg7MzYwMDs1NzAw'),
            ),
            title: Text(title02),
            subtitle: Text('#2'),
            onTap: () async {
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
                    collection: 'bestof02',
                    text: title02,
                  ),
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://resizing.flixster.com/TiuoBM5RmDHKE_0mr41ljMjObNY=/180x267/v1.bTsxMzAyMzkxNjtqOzE4NTI2OzIwNDg7MTA4NjsxNjA5'),
            ),
            title: Text(title03),
            subtitle: Text('#3'),
            onTap: () async {
              FirebaseUser user = await auth.signInWithEmailAndPassword(
                email: email,
                password: password,
              );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Chat(
                    user: user,
                    collection: 'bestof03',
                    text: title03,
                  ),
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://resizing.flixster.com/DooEsqhJJObVtfeply60wL3uT0o=/180x267/v1.bTsxMzE5MDI4NjtqOzE4NTc4OzIwNDg7MTk0NDsyODgw'),
            ),
            title: Text(title04),
            subtitle: Text('#4'),
            onTap: () async {
              FirebaseUser user = await auth.signInWithEmailAndPassword(
                email: email,
                password: password,
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Chat(
                    user: user,
                    collection: 'bestof04',
                    text: title04,
                  ),
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://resizing.flixster.com/P3R9VT8bXgcGP6XCer5Ff0Sft5k=/180x267/v1.bTsxMzAxNzc1MjtqOzE4NTI3OzIwNDg7MjAyNjszMDAx'),
            ),
            title: Text(title05),
            subtitle: Text('#5'),
            onTap: () async {
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
                    collection: 'bestof05',
                    text: title05,
                  ),
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://resizing.flixster.com/sDfkqMMdsKzxTViufoXsoSWY9hU=/180x267/v1.bTsxMzA2NjY1MjtqOzE4NTEzOzIwNDg7MjAyNTszMDAw'),
            ),
            title: Text(title06),
            subtitle: Text('#6'),
            onTap: () async {
              FirebaseUser user = await auth.signInWithEmailAndPassword(
                email: email,
                password: password,
              );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Chat(
                    user: user,
                    collection: 'bestof06',
                    text: title06,
                  ),
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://resizing.flixster.com/d4w5gr4nJ2zPon6nddELjn-Brek=/180x267/v1.bTsxMzA0NjcwMjtqOzE4NTQzOzIwNDg7NjA3Mjs5MDAw'),
            ),
            title: Text(title07),
            subtitle: Text('#7'),
            onTap: () async {
              FirebaseUser user = await auth.signInWithEmailAndPassword(
                email: email,
                password: password,
              );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Chat(
                    user: user,
                    collection: 'bestof07',
                    text: title07,
                  ),
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://resizing.flixster.com/5gcCn6oDnWp6LfLVYoibnE0j2mc=/169x250/v1.bTsxMzEwMTEzNDtqOzE4NTI1OzIwNDg7MTY5OzI1MA'),
            ),
            title: Text(title08),
            subtitle: Text('#8'),
            onTap: () async {
              FirebaseUser user = await auth.signInWithEmailAndPassword(
                email: email,
                password: password,
              );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Chat(
                    user: user,
                    collection: 'bestof08',
                    text: title08,
                  ),
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://resizing.flixster.com/U23MH6EJxaqIpRBHKXWaad8d77c=/180x267/v1.bTsxMzAxODU5MTtqOzE4NTExOzIwNDg7Mjc2NDs0MDk2'),
            ),
            title: Text(title09),
            subtitle: Text('#9'),
            onTap: () async {
              FirebaseUser user = await auth.signInWithEmailAndPassword(
                email: email,
                password: password,
              );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Chat(
                    user: user,
                    collection: 'bestof09',
                    text: title09,
                  ),
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://resizing.flixster.com/SuAA3Okv_aD8XtEqM5fMBJpD-vk=/180x267/v1.bTsxMzIzMzkwOTtqOzE4NTk3OzIwNDg7NjA3Mjs5MDAw'),
            ),
            title: Text(title10),
            subtitle: Text('#10'),
            onTap: () async {
              FirebaseUser user = await auth.signInWithEmailAndPassword(
                email: email,
                password: password,
              );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Chat(
                    user: user,
                    collection: 'bestof10',
                    text: title10,
                  ),
                ),
              );
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
