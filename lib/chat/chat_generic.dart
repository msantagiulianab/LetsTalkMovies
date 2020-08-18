import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multiroomchat/animations/BouncyPageRoute.dart';
import 'package:multiroomchat/chat_widgets/message.dart';
import 'package:multiroomchat/chat_widgets/send.dart';
import 'package:multiroomchat/pages/multipage.dart';

class Chat extends StatefulWidget {
  final FirebaseUser user;

  static const String id = "CHAT";

  final String collection;

  final String text;

  Chat({Key key, this.user, this.collection, this.text}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;

  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();

  Future<void> callback() async {
    if (messageController.text.length > 0) {
      await _firestore.collection(widget.collection).add({
        'text': messageController.text,
        'from': widget.user.email,
        'date': DateTime.now().toIso8601String().toString(),
      });
      messageController.clear();
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
    }
  }

//  Future<bool> _onBackPressed() async => Navigator.maybePop(
//        context,
//        MaterialPageRoute(builder: (context) => MultiPage()),
//      );

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
//      onWillPop: () {
//        Navigator.push(context, MaterialPageRoute(builder: (context) => MultiPage()));
//      },
      onWillPop: () => Future.value(true),
      child: Scaffold(
        appBar: AppBar(
          leading: Hero(
            tag: 'logo',
            child: Container(
              height: 40.0,
              child: Container(
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    _auth.signOut();
                    Navigator.push(
                      context,
                      BouncyPageRoute(widget: MultiPage()),
                    );
                  },
                ),
              ),
            ),
          ),
          title: Text(widget.text),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: _firestore
                      .collection(widget.collection)
                      .orderBy('date')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData)
                      return Center(
                        child: CircularProgressIndicator(),
                      );

                    List<DocumentSnapshot> docs = snapshot.data.documents;

                    List<Widget> messages = docs
                        .map((doc) => Message(
                              from: doc.data['from'],
                              text: doc.data['text'],
                              me: widget.user.email == doc.data['from'],
                            ))
                        .toList();

                    return ListView(
                      controller: scrollController,
                      children: <Widget>[
                        ...messages,
                      ],
                    );
                  },
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        onSubmitted: (value) => callback(),
                        decoration: InputDecoration(
                          hintText: "Enter a Message...",
                          border: const OutlineInputBorder(),
                        ),
                        controller: messageController,
                      ),
                    ),
                    SendButton(
                      text: "Send",
                      callback: callback,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
