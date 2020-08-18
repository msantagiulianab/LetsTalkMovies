import 'package:flutter/material.dart';
import 'package:multiroomchat/pages/home_page.dart';
import 'package:multiroomchat/pages/login.dart';
import 'package:multiroomchat/pages/register.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'let\'s talk MOVIES',
      theme: ThemeData.dark(),
      initialRoute: HomePage.id,
      routes: {
        HomePage.id: (context) => HomePage(),
        Registration.id: (context) => Registration(),
        Login.id: (context) => Login(),
//        Chat.id: (context) => Chat(),
      },
    );
  }
}

//class BestOfChat01 extends StatefulWidget {
//  static const String id = "CHAT";
//  final FirebaseUser user;
//
//  const BestOfChat01({Key key, this.user}) : super(key: key);
//
//  @override
//  _BestOfChat01State createState() => _BestOfChat01State();
//}
//
//class _BestOfChat01State extends State<BestOfChat01> {
//  final FirebaseAuth _auth = FirebaseAuth.instance;
//  final Firestore _firestore = Firestore.instance;
//
//  TextEditingController messageController = TextEditingController();
//  ScrollController scrollController = ScrollController();
//
//  Future<void> callback() async {
//    if (messageController.text.length > 0) {
//      await _firestore.collection('bestof01').add({
//        'text': messageController.text,
//        'from': widget.user.email,
//        'date': DateTime.now().toIso8601String().toString(),
//      });
//      messageController.clear();
//      scrollController.animateTo(
//        scrollController.position.maxScrollExtent,
//        curve: Curves.easeOut,
//        duration: const Duration(milliseconds: 300),
//      );
//    }
//  }
//
//////////////////////////////
//
//  Future<bool> _onBackPressed() async => Navigator.maybePop(
//        context,
//        MaterialPageRoute(builder: (context) => MultiPage()),
//      );
//
////////////////////////////////
//
//  @override
//  Widget build(BuildContext context) {
//    return WillPopScope(
//      onWillPop: () => Future.value(true),
//      child: Scaffold(
//        appBar: AppBar(
//          leading: Hero(
//            tag: 'logo',
//            child: Container(
//              height: 40.0,
//              child: Container(
//                child: IconButton(
//                  icon: Icon(Icons.arrow_back),
//                  onPressed: () {
//                    _auth.signOut();
//                    Navigator.push(
//                      context,
//                      BouncyPageRoute(widget: MultiPage()),
//                    );
//                  },
//                ),
//              ),
//            ),
//          ),
//          title: Text('Avengers: Endgame'),
//        ),
//        body: SafeArea(
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: <Widget>[
//              Expanded(
//                child: StreamBuilder<QuerySnapshot>(
//                  stream: _firestore
//                      .collection('bestof01')
//                      .orderBy('date')
//                      .snapshots(),
//                  builder: (context, snapshot) {
//                    if (!snapshot.hasData)
//                      return Center(
//                        child: CircularProgressIndicator(),
//                      );
//
//                    List<DocumentSnapshot> docs = snapshot.data.documents;
//
//                    List<Widget> messages = docs
//                        .map((doc) => Message(
//                              from: doc.data['from'],
//                              text: doc.data['text'],
//                              me: widget.user.email == doc.data['from'],
//                            ))
//                        .toList();
//
//                    return ListView(
//                      controller: scrollController,
//                      children: <Widget>[
//                        ...messages,
//                      ],
//                    );
//                  },
//                ),
//              ),
//              Container(
//                child: Row(
//                  children: <Widget>[
//                    Expanded(
//                      child: TextField(
//                        onSubmitted: (value) => callback(),
//                        decoration: InputDecoration(
//                          hintText: "Enter a Message...",
//                          border: const OutlineInputBorder(),
//                        ),
//                        controller: messageController,
//                      ),
//                    ),
//                    SendButton(
//                      text: "Send",
//                      callback: callback,
//                    )
//                  ],
//                ),
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
//
//class BestOfChat02 extends StatefulWidget {
//  static const String id = "CHAT";
//  final FirebaseUser user;
//
//  const BestOfChat02({Key key, this.user}) : super(key: key);
//
//  @override
//  _BestOfChat02State createState() => _BestOfChat02State();
//}
//
//class _BestOfChat02State extends State<BestOfChat02> {
//  final FirebaseAuth _auth = FirebaseAuth.instance;
//  final Firestore _firestore = Firestore.instance;
//
//  TextEditingController messageController = TextEditingController();
//  ScrollController scrollController = ScrollController();
//
//  Future<void> callback() async {
//    if (messageController.text.length > 0) {
//      await _firestore.collection('bestof02').add({
//        'text': messageController.text,
//        'from': widget.user.email,
//        'date': DateTime.now().toIso8601String().toString(),
//      });
//      messageController.clear();
//      scrollController.animateTo(
//        scrollController.position.maxScrollExtent,
//        curve: Curves.easeOut,
//        duration: const Duration(milliseconds: 300),
//      );
//    }
//  }
//
//////////////////////////////
//
//  Future<bool> _onBackPressed() async => Navigator.maybePop(
//        context,
//        MaterialPageRoute(builder: (context) => MultiPage()),
//      );
//
////////////////////////////////
//
//  @override
//  Widget build(BuildContext context) {
//    return WillPopScope(
//      onWillPop: () => Future.value(true),
//      child: Scaffold(
//        appBar: AppBar(
//          leading: Hero(
//            tag: 'logo',
//            child: Container(
//              height: 40.0,
//              child: Container(
//                child: IconButton(
//                  icon: Icon(Icons.arrow_back),
//                  onPressed: () {
//                    _auth.signOut();
//                    Navigator.push(
//                      context,
//                      BouncyPageRoute(widget: MultiPage()),
//                    );
//                  },
//                ),
//              ),
//            ),
//          ),
//          title: Text('US'),
//        ),
//        body: SafeArea(
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: <Widget>[
//              Expanded(
//                child: StreamBuilder<QuerySnapshot>(
//                  stream: _firestore
//                      .collection('bestof02')
//                      .orderBy('date')
//                      .snapshots(),
//                  builder: (context, snapshot) {
//                    if (!snapshot.hasData)
//                      return Center(
//                        child: CircularProgressIndicator(),
//                      );
//
//                    List<DocumentSnapshot> docs = snapshot.data.documents;
//
//                    List<Widget> messages = docs
//                        .map((doc) => Message(
//                              from: doc.data['from'],
//                              text: doc.data['text'],
//                              me: widget.user.email == doc.data['from'],
//                            ))
//                        .toList();
//
//                    return ListView(
//                      controller: scrollController,
//                      children: <Widget>[
//                        ...messages,
//                      ],
//                    );
//                  },
//                ),
//              ),
//              Container(
//                child: Row(
//                  children: <Widget>[
//                    Expanded(
//                      child: TextField(
//                        onSubmitted: (value) => callback(),
//                        decoration: InputDecoration(
//                          hintText: "Enter a Message...",
//                          border: const OutlineInputBorder(),
//                        ),
//                        controller: messageController,
//                      ),
//                    ),
//                    SendButton(
//                      text: "Send",
//                      callback: callback,
//                    )
//                  ],
//                ),
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
//
//class BestOfChat03 extends StatefulWidget {
//  static const String id = "CHAT";
//  final FirebaseUser user;
//
//  const BestOfChat03({Key key, this.user}) : super(key: key);
//
//  @override
//  _BestOfChat03State createState() => _BestOfChat03State();
//}
//
//class _BestOfChat03State extends State<BestOfChat03> {
//  final FirebaseAuth _auth = FirebaseAuth.instance;
//  final Firestore _firestore = Firestore.instance;
//
//  TextEditingController messageController = TextEditingController();
//  ScrollController scrollController = ScrollController();
//
//  Future<void> callback() async {
//    if (messageController.text.length > 0) {
//      await _firestore.collection('bestof03').add({
//        'text': messageController.text,
//        'from': widget.user.email,
//        'date': DateTime.now().toIso8601String().toString(),
//      });
//      messageController.clear();
//      scrollController.animateTo(
//        scrollController.position.maxScrollExtent,
//        curve: Curves.easeOut,
//        duration: const Duration(milliseconds: 300),
//      );
//    }
//  }
//
//////////////////////////////
//
//  Future<bool> _onBackPressed() async => Navigator.maybePop(
//        context,
//        MaterialPageRoute(builder: (context) => MultiPage()),
//      );
//
////////////////////////////////
//
//  @override
//  Widget build(BuildContext context) {
//    return WillPopScope(
//      onWillPop: () => Future.value(true),
//      child: Scaffold(
//        appBar: AppBar(
//          leading: Hero(
//            tag: 'logo',
//            child: Container(
//              height: 40.0,
//              child: Container(
//                child: IconButton(
//                  icon: Icon(Icons.arrow_back),
//                  onPressed: () {
//                    _auth.signOut();
//                    Navigator.push(
//                      context,
//                      BouncyPageRoute(widget: MultiPage()),
//                    );
//                  },
//                ),
//              ),
//            ),
//          ),
//          title: Text('TOY STORY 4'),
//        ),
//        body: SafeArea(
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: <Widget>[
//              Expanded(
//                child: StreamBuilder<QuerySnapshot>(
//                  stream: _firestore
//                      .collection('bestof03')
//                      .orderBy('date')
//                      .snapshots(),
//                  builder: (context, snapshot) {
//                    if (!snapshot.hasData)
//                      return Center(
//                        child: CircularProgressIndicator(),
//                      );
//
//                    List<DocumentSnapshot> docs = snapshot.data.documents;
//
//                    List<Widget> messages = docs
//                        .map((doc) => Message(
//                              from: doc.data['from'],
//                              text: doc.data['text'],
//                              me: widget.user.email == doc.data['from'],
//                            ))
//                        .toList();
//
//                    return ListView(
//                      controller: scrollController,
//                      children: <Widget>[
//                        ...messages,
//                      ],
//                    );
//                  },
//                ),
//              ),
//              Container(
//                child: Row(
//                  children: <Widget>[
//                    Expanded(
//                      child: TextField(
//                        onSubmitted: (value) => callback(),
//                        decoration: InputDecoration(
//                          hintText: "Enter a Message...",
//                          border: const OutlineInputBorder(),
//                        ),
//                        controller: messageController,
//                      ),
//                    ),
//                    SendButton(
//                      text: "Send",
//                      callback: callback,
//                    )
//                  ],
//                ),
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
//
//class BestOfChat04 extends StatefulWidget {
//  static const String id = "CHAT";
//  final FirebaseUser user;
//
//  const BestOfChat04({Key key, this.user}) : super(key: key);
//
//  @override
//  _BestOfChat04State createState() => _BestOfChat04State();
//}
//
//class _BestOfChat04State extends State<BestOfChat04> {
//  final FirebaseAuth _auth = FirebaseAuth.instance;
//  final Firestore _firestore = Firestore.instance;
//
//  TextEditingController messageController = TextEditingController();
//  ScrollController scrollController = ScrollController();
//
//  Future<void> callback() async {
//    if (messageController.text.length > 0) {
//      await _firestore.collection('bestof04').add({
//        'text': messageController.text,
//        'from': widget.user.email,
//        'date': DateTime.now().toIso8601String().toString(),
//      });
//      messageController.clear();
//      scrollController.animateTo(
//        scrollController.position.maxScrollExtent,
//        curve: Curves.easeOut,
//        duration: const Duration(milliseconds: 300),
//      );
//    }
//  }
//
//////////////////////////////
//
//  Future<bool> _onBackPressed() async => Navigator.maybePop(
//        context,
//        MaterialPageRoute(builder: (context) => MultiPage()),
//      );
//
////////////////////////////////
//
//  @override
//  Widget build(BuildContext context) {
//    return WillPopScope(
//      onWillPop: () => Future.value(true),
//      child: Scaffold(
//        appBar: AppBar(
//          leading: Hero(
//            tag: 'logo',
//            child: Container(
//              height: 40.0,
//              child: Container(
//                child: IconButton(
//                  icon: Icon(Icons.arrow_back),
//                  onPressed: () {
//                    _auth.signOut();
//                    Navigator.push(
//                      context,
//                      BouncyPageRoute(widget: MultiPage()),
//                    );
//                  },
//                ),
//              ),
//            ),
//          ),
//          title: Text('KNIVES OUT'),
//        ),
//        body: SafeArea(
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: <Widget>[
//              Expanded(
//                child: StreamBuilder<QuerySnapshot>(
//                  stream: _firestore
//                      .collection('bestof04')
//                      .orderBy('date')
//                      .snapshots(),
//                  builder: (context, snapshot) {
//                    if (!snapshot.hasData)
//                      return Center(
//                        child: CircularProgressIndicator(),
//                      );
//
//                    List<DocumentSnapshot> docs = snapshot.data.documents;
//
//                    List<Widget> messages = docs
//                        .map((doc) => Message(
//                              from: doc.data['from'],
//                              text: doc.data['text'],
//                              me: widget.user.email == doc.data['from'],
//                            ))
//                        .toList();
//
//                    return ListView(
//                      controller: scrollController,
//                      children: <Widget>[
//                        ...messages,
//                      ],
//                    );
//                  },
//                ),
//              ),
//              Container(
//                child: Row(
//                  children: <Widget>[
//                    Expanded(
//                      child: TextField(
//                        onSubmitted: (value) => callback(),
//                        decoration: InputDecoration(
//                          hintText: "Enter a Message...",
//                          border: const OutlineInputBorder(),
//                        ),
//                        controller: messageController,
//                      ),
//                    ),
//                    SendButton(
//                      text: "Send",
//                      callback: callback,
//                    )
//                  ],
//                ),
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
//
//class BestOfChat05 extends StatefulWidget {
//  static const String id = "CHAT";
//  final FirebaseUser user;
//
//  const BestOfChat05({Key key, this.user}) : super(key: key);
//
//  @override
//  _BestOfChat05State createState() => _BestOfChat05State();
//}
//
//class _BestOfChat05State extends State<BestOfChat05> {
//  final FirebaseAuth _auth = FirebaseAuth.instance;
//  final Firestore _firestore = Firestore.instance;
//
//  TextEditingController messageController = TextEditingController();
//  ScrollController scrollController = ScrollController();
//
//  Future<void> callback() async {
//    if (messageController.text.length > 0) {
//      await _firestore.collection('bestof05').add({
//        'text': messageController.text,
//        'from': widget.user.email,
//        'date': DateTime.now().toIso8601String().toString(),
//      });
//      messageController.clear();
//      scrollController.animateTo(
//        scrollController.position.maxScrollExtent,
//        curve: Curves.easeOut,
//        duration: const Duration(milliseconds: 300),
//      );
//    }
//  }
//
//////////////////////////////
//
//  Future<bool> _onBackPressed() async => Navigator.maybePop(
//        context,
//        MaterialPageRoute(builder: (context) => MultiPage()),
//      );
//
////////////////////////////////
//
//  @override
//  Widget build(BuildContext context) {
//    return WillPopScope(
//      onWillPop: () => Future.value(true),
//      child: Scaffold(
//        appBar: AppBar(
//          leading: Hero(
//            tag: 'logo',
//            child: Container(
//              height: 40.0,
//              child: Container(
//                child: IconButton(
//                  icon: Icon(Icons.arrow_back),
//                  onPressed: () {
//                    _auth.signOut();
//                    Navigator.push(
//                      context,
//                      BouncyPageRoute(widget: MultiPage()),
//                    );
//                  },
//                ),
//              ),
//            ),
//          ),
//          title: Text('BOOKSMART'),
//        ),
//        body: SafeArea(
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: <Widget>[
//              Expanded(
//                child: StreamBuilder<QuerySnapshot>(
//                  stream: _firestore
//                      .collection('bestof05')
//                      .orderBy('date')
//                      .snapshots(),
//                  builder: (context, snapshot) {
//                    if (!snapshot.hasData)
//                      return Center(
//                        child: CircularProgressIndicator(),
//                      );
//
//                    List<DocumentSnapshot> docs = snapshot.data.documents;
//
//                    List<Widget> messages = docs
//                        .map((doc) => Message(
//                              from: doc.data['from'],
//                              text: doc.data['text'],
//                              me: widget.user.email == doc.data['from'],
//                            ))
//                        .toList();
//
//                    return ListView(
//                      controller: scrollController,
//                      children: <Widget>[
//                        ...messages,
//                      ],
//                    );
//                  },
//                ),
//              ),
//              Container(
//                child: Row(
//                  children: <Widget>[
//                    Expanded(
//                      child: TextField(
//                        onSubmitted: (value) => callback(),
//                        decoration: InputDecoration(
//                          hintText: "Enter a Message...",
//                          border: const OutlineInputBorder(),
//                        ),
//                        controller: messageController,
//                      ),
//                    ),
//                    SendButton(
//                      text: "Send",
//                      callback: callback,
//                    )
//                  ],
//                ),
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
//
//class BestOfChat06 extends StatefulWidget {
//  static const String id = "CHAT";
//  final FirebaseUser user;
//
//  const BestOfChat06({Key key, this.user}) : super(key: key);
//
//  @override
//  _BestOfChat06State createState() => _BestOfChat06State();
//}
//
//class _BestOfChat06State extends State<BestOfChat06> {
//  final FirebaseAuth _auth = FirebaseAuth.instance;
//  final Firestore _firestore = Firestore.instance;
//
//  TextEditingController messageController = TextEditingController();
//  ScrollController scrollController = ScrollController();
//
//  Future<void> callback() async {
//    if (messageController.text.length > 0) {
//      await _firestore.collection('bestof06').add({
//        'text': messageController.text,
//        'from': widget.user.email,
//        'date': DateTime.now().toIso8601String().toString(),
//      });
//      messageController.clear();
//      scrollController.animateTo(
//        scrollController.position.maxScrollExtent,
//        curve: Curves.easeOut,
//        duration: const Duration(milliseconds: 300),
//      );
//    }
//  }
//
//////////////////////////////
//
//  Future<bool> _onBackPressed() async => Navigator.maybePop(
//        context,
//        MaterialPageRoute(builder: (context) => MultiPage()),
//      );
//
////////////////////////////////
//
//  @override
//  Widget build(BuildContext context) {
//    return WillPopScope(
//      onWillPop: () => Future.value(true),
//      child: Scaffold(
//        appBar: AppBar(
//          leading: Hero(
//            tag: 'logo',
//            child: Container(
//              height: 40.0,
//              child: Container(
//                child: IconButton(
//                  icon: Icon(Icons.arrow_back),
//                  onPressed: () {
//                    _auth.signOut();
//                    Navigator.push(
//                      context,
//                      BouncyPageRoute(widget: MultiPage()),
//                    );
//                  },
//                ),
//              ),
//            ),
//          ),
//          title: Text('The Farewell'),
//        ),
//        body: SafeArea(
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: <Widget>[
//              Expanded(
//                child: StreamBuilder<QuerySnapshot>(
//                  stream: _firestore
//                      .collection('bestof06')
//                      .orderBy('date')
//                      .snapshots(),
//                  builder: (context, snapshot) {
//                    if (!snapshot.hasData)
//                      return Center(
//                        child: CircularProgressIndicator(),
//                      );
//
//                    List<DocumentSnapshot> docs = snapshot.data.documents;
//
//                    List<Widget> messages = docs
//                        .map((doc) => Message(
//                              from: doc.data['from'],
//                              text: doc.data['text'],
//                              me: widget.user.email == doc.data['from'],
//                            ))
//                        .toList();
//
//                    return ListView(
//                      controller: scrollController,
//                      children: <Widget>[
//                        ...messages,
//                      ],
//                    );
//                  },
//                ),
//              ),
//              Container(
//                child: Row(
//                  children: <Widget>[
//                    Expanded(
//                      child: TextField(
//                        onSubmitted: (value) => callback(),
//                        decoration: InputDecoration(
//                          hintText: "Enter a Message...",
//                          border: const OutlineInputBorder(),
//                        ),
//                        controller: messageController,
//                      ),
//                    ),
//                    SendButton(
//                      text: "Send",
//                      callback: callback,
//                    )
//                  ],
//                ),
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
//
//class BestOfChat07 extends StatefulWidget {
//  static const String id = "CHAT";
//  final FirebaseUser user;
//
//  const BestOfChat07({Key key, this.user}) : super(key: key);
//
//  @override
//  _BestOfChat07State createState() => _BestOfChat07State();
//}
//
//class _BestOfChat07State extends State<BestOfChat07> {
//  final FirebaseAuth _auth = FirebaseAuth.instance;
//  final Firestore _firestore = Firestore.instance;
//
//  TextEditingController messageController = TextEditingController();
//  ScrollController scrollController = ScrollController();
//
//  Future<void> callback() async {
//    if (messageController.text.length > 0) {
//      await _firestore.collection('bestof07').add({
//        'text': messageController.text,
//        'from': widget.user.email,
//        'date': DateTime.now().toIso8601String().toString(),
//      });
//      messageController.clear();
//      scrollController.animateTo(
//        scrollController.position.maxScrollExtent,
//        curve: Curves.easeOut,
//        duration: const Duration(milliseconds: 300),
//      );
//    }
//  }
//
//////////////////////////////
//
//  Future<bool> _onBackPressed() async => Navigator.maybePop(
//        context,
//        MaterialPageRoute(builder: (context) => MultiPage()),
//      );
//
////////////////////////////////
//
//  @override
//  Widget build(BuildContext context) {
//    return WillPopScope(
//      onWillPop: () => Future.value(true),
//      child: Scaffold(
//        appBar: AppBar(
//          leading: Hero(
//            tag: 'logo',
//            child: Container(
//              height: 40.0,
//              child: Container(
//                child: IconButton(
//                  icon: Icon(Icons.arrow_back),
//                  onPressed: () {
//                    _auth.signOut();
//                    Navigator.push(
//                      context,
//                      BouncyPageRoute(widget: MultiPage()),
//                    );
//                  },
//                ),
//              ),
//            ),
//          ),
//          title: Text('Spider-Man: Far From Home'),
//        ),
//        body: SafeArea(
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: <Widget>[
//              Expanded(
//                child: StreamBuilder<QuerySnapshot>(
//                  stream: _firestore
//                      .collection('bestof07')
//                      .orderBy('date')
//                      .snapshots(),
//                  builder: (context, snapshot) {
//                    if (!snapshot.hasData)
//                      return Center(
//                        child: CircularProgressIndicator(),
//                      );
//
//                    List<DocumentSnapshot> docs = snapshot.data.documents;
//
//                    List<Widget> messages = docs
//                        .map((doc) => Message(
//                              from: doc.data['from'],
//                              text: doc.data['text'],
//                              me: widget.user.email == doc.data['from'],
//                            ))
//                        .toList();
//
//                    return ListView(
//                      controller: scrollController,
//                      children: <Widget>[
//                        ...messages,
//                      ],
//                    );
//                  },
//                ),
//              ),
//              Container(
//                child: Row(
//                  children: <Widget>[
//                    Expanded(
//                      child: TextField(
//                        onSubmitted: (value) => callback(),
//                        decoration: InputDecoration(
//                          hintText: "Enter a Message...",
//                          border: const OutlineInputBorder(),
//                        ),
//                        controller: messageController,
//                      ),
//                    ),
//                    SendButton(
//                      text: "Send",
//                      callback: callback,
//                    )
//                  ],
//                ),
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
//
//class BestOfChat08 extends StatefulWidget {
//  static const String id = "CHAT";
//  final FirebaseUser user;
//
//  const BestOfChat08({Key key, this.user}) : super(key: key);
//
//  @override
//  _BestOfChat08State createState() => _BestOfChat08State();
//}
//
//class _BestOfChat08State extends State<BestOfChat08> {
//  final FirebaseAuth _auth = FirebaseAuth.instance;
//  final Firestore _firestore = Firestore.instance;
//
//  TextEditingController messageController = TextEditingController();
//  ScrollController scrollController = ScrollController();
//
//  Future<void> callback() async {
//    if (messageController.text.length > 0) {
//      await _firestore.collection('bestof08').add({
//        'text': messageController.text,
//        'from': widget.user.email,
//        'date': DateTime.now().toIso8601String().toString(),
//      });
//      messageController.clear();
//      scrollController.animateTo(
//        scrollController.position.maxScrollExtent,
//        curve: Curves.easeOut,
//        duration: const Duration(milliseconds: 300),
//      );
//    }
//  }
//
//////////////////////////////
//
//  Future<bool> _onBackPressed() async => Navigator.maybePop(
//        context,
//        MaterialPageRoute(builder: (context) => MultiPage()),
//      );
//
////////////////////////////////
//
//  @override
//  Widget build(BuildContext context) {
//    return WillPopScope(
//      onWillPop: () => Future.value(true),
//      child: Scaffold(
//        appBar: AppBar(
//          leading: Hero(
//            tag: 'logo',
//            child: Container(
//              height: 40.0,
//              child: Container(
//                child: IconButton(
//                  icon: Icon(Icons.arrow_back),
//                  onPressed: () {
//                    _auth.signOut();
//                    Navigator.push(
//                      context,
//                      BouncyPageRoute(widget: MultiPage()),
//                    );
//                  },
//                ),
//              ),
//            ),
//          ),
//          title: Text('Once Upon a Time In Hollywood'),
//        ),
//        body: SafeArea(
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: <Widget>[
//              Expanded(
//                child: StreamBuilder<QuerySnapshot>(
//                  stream: _firestore
//                      .collection('bestof08')
//                      .orderBy('date')
//                      .snapshots(),
//                  builder: (context, snapshot) {
//                    if (!snapshot.hasData)
//                      return Center(
//                        child: CircularProgressIndicator(),
//                      );
//
//                    List<DocumentSnapshot> docs = snapshot.data.documents;
//
//                    List<Widget> messages = docs
//                        .map((doc) => Message(
//                              from: doc.data['from'],
//                              text: doc.data['text'],
//                              me: widget.user.email == doc.data['from'],
//                            ))
//                        .toList();
//
//                    return ListView(
//                      controller: scrollController,
//                      children: <Widget>[
//                        ...messages,
//                      ],
//                    );
//                  },
//                ),
//              ),
//              Container(
//                child: Row(
//                  children: <Widget>[
//                    Expanded(
//                      child: TextField(
//                        onSubmitted: (value) => callback(),
//                        decoration: InputDecoration(
//                          hintText: "Enter a Message...",
//                          border: const OutlineInputBorder(),
//                        ),
//                        controller: messageController,
//                      ),
//                    ),
//                    SendButton(
//                      text: "Send",
//                      callback: callback,
//                    )
//                  ],
//                ),
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
//
//class BestOfChat09 extends StatefulWidget {
//  static const String id = "CHAT";
//  final FirebaseUser user;
//
//  const BestOfChat09({Key key, this.user}) : super(key: key);
//
//  @override
//  _BestOfChat09State createState() => _BestOfChat09State();
//}
//
//class _BestOfChat09State extends State<BestOfChat09> {
//  final FirebaseAuth _auth = FirebaseAuth.instance;
//  final Firestore _firestore = Firestore.instance;
//
//  TextEditingController messageController = TextEditingController();
//  ScrollController scrollController = ScrollController();
//
//  Future<void> callback() async {
//    if (messageController.text.length > 0) {
//      await _firestore.collection('bestof09').add({
//        'text': messageController.text,
//        'from': widget.user.email,
//        'date': DateTime.now().toIso8601String().toString(),
//      });
//      messageController.clear();
//      scrollController.animateTo(
//        scrollController.position.maxScrollExtent,
//        curve: Curves.easeOut,
//        duration: const Duration(milliseconds: 300),
//      );
//    }
//  }
//
//////////////////////////////
//
//  Future<bool> _onBackPressed() async => Navigator.maybePop(
//        context,
//        MaterialPageRoute(builder: (context) => MultiPage()),
//      );
//
////////////////////////////////
//
//  @override
//  Widget build(BuildContext context) {
//    return WillPopScope(
//      onWillPop: () => Future.value(true),
//      child: Scaffold(
//        appBar: AppBar(
//          leading: Hero(
//            tag: 'logo',
//            child: Container(
//              height: 40.0,
//              child: Container(
//                child: IconButton(
//                  icon: Icon(Icons.arrow_back),
//                  onPressed: () {
//                    _auth.signOut();
//                    Navigator.push(
//                      context,
//                      BouncyPageRoute(widget: MultiPage()),
//                    );
//                  },
//                ),
//              ),
//            ),
//          ),
//          title: Text('SHAZAM!'),
//        ),
//        body: SafeArea(
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: <Widget>[
//              Expanded(
//                child: StreamBuilder<QuerySnapshot>(
//                  stream: _firestore
//                      .collection('bestof09')
//                      .orderBy('date')
//                      .snapshots(),
//                  builder: (context, snapshot) {
//                    if (!snapshot.hasData)
//                      return Center(
//                        child: CircularProgressIndicator(),
//                      );
//
//                    List<DocumentSnapshot> docs = snapshot.data.documents;
//
//                    List<Widget> messages = docs
//                        .map((doc) => Message(
//                              from: doc.data['from'],
//                              text: doc.data['text'],
//                              me: widget.user.email == doc.data['from'],
//                            ))
//                        .toList();
//
//                    return ListView(
//                      controller: scrollController,
//                      children: <Widget>[
//                        ...messages,
//                      ],
//                    );
//                  },
//                ),
//              ),
//              Container(
//                child: Row(
//                  children: <Widget>[
//                    Expanded(
//                      child: TextField(
//                        onSubmitted: (value) => callback(),
//                        decoration: InputDecoration(
//                          hintText: "Enter a Message...",
//                          border: const OutlineInputBorder(),
//                        ),
//                        controller: messageController,
//                      ),
//                    ),
//                    SendButton(
//                      text: "Send",
//                      callback: callback,
//                    )
//                  ],
//                ),
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
//
//class BestOfChat10 extends StatefulWidget {
//  static const String id = "CHAT";
//  final FirebaseUser user;
//
//  const BestOfChat10({Key key, this.user}) : super(key: key);
//
//  @override
//  _BestOfChat10State createState() => _BestOfChat10State();
//}
//
//class _BestOfChat10State extends State<BestOfChat10> {
//  final FirebaseAuth _auth = FirebaseAuth.instance;
//  final Firestore _firestore = Firestore.instance;
//
//  TextEditingController messageController = TextEditingController();
//  ScrollController scrollController = ScrollController();
//
//  Future<void> callback() async {
//    if (messageController.text.length > 0) {
//      await _firestore.collection('bestof10').add({
//        'text': messageController.text,
//        'from': widget.user.email,
//        'date': DateTime.now().toIso8601String().toString(),
//      });
//      messageController.clear();
//      scrollController.animateTo(
//        scrollController.position.maxScrollExtent,
//        curve: Curves.easeOut,
//        duration: const Duration(milliseconds: 300),
//      );
//    }
//  }
//
//////////////////////////////
//
//  Future<bool> _onBackPressed() async => Navigator.maybePop(
//        context,
//        MaterialPageRoute(builder: (context) => MultiPage()),
//      );
//
////////////////////////////////
//
//  @override
//  Widget build(BuildContext context) {
//    return WillPopScope(
//      onWillPop: () => Future.value(true),
//      child: Scaffold(
//        appBar: AppBar(
//          leading: Hero(
//            tag: 'logo',
//            child: Container(
//              height: 40.0,
//              child: Container(
//                child: IconButton(
//                  icon: Icon(Icons.arrow_back),
//                  onPressed: () {
//                    _auth.signOut();
//                    Navigator.push(
//                      context,
//                      BouncyPageRoute(widget: MultiPage()),
//                    );
//                  },
//                ),
//              ),
//            ),
//          ),
//          title: Text("LITTLE WOMEN"),
//        ),
//        body: SafeArea(
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: <Widget>[
//              Expanded(
//                child: StreamBuilder<QuerySnapshot>(
//                  stream: _firestore
//                      .collection('bestof10')
//                      .orderBy('date')
//                      .snapshots(),
//                  builder: (context, snapshot) {
//                    if (!snapshot.hasData)
//                      return Center(
//                        child: CircularProgressIndicator(),
//                      );
//
//                    List<DocumentSnapshot> docs = snapshot.data.documents;
//
//                    List<Widget> messages = docs
//                        .map((doc) => Message(
//                              from: doc.data['from'],
//                              text: doc.data['text'],
//                              me: widget.user.email == doc.data['from'],
//                            ))
//                        .toList();
//
//                    return ListView(
//                      controller: scrollController,
//                      children: <Widget>[
//                        ...messages,
//                      ],
//                    );
//                  },
//                ),
//              ),
//              Container(
//                child: Row(
//                  children: <Widget>[
//                    Expanded(
//                      child: TextField(
//                        onSubmitted: (value) => callback(),
//                        decoration: InputDecoration(
//                          hintText: "Enter a Message...",
//                          border: const OutlineInputBorder(),
//                        ),
//                        controller: messageController,
//                      ),
//                    ),
//                    SendButton(
//                      text: "Send",
//                      callback: callback,
//                    )
//                  ],
//                ),
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
//
//class MessageAuthor extends StatefulWidget {
//  static const String id = "CHAT";
//  final FirebaseUser user;
//
//  const MessageAuthor({Key key, this.user}) : super(key: key);
//
//  @override
//  _MessageAuthorState createState() => _MessageAuthorState();
//}
//
//class _MessageAuthorState extends State<MessageAuthor> {
//  final FirebaseAuth _auth = FirebaseAuth.instance;
//  final Firestore _firestore = Firestore.instance;
//
//  TextEditingController messageController = TextEditingController();
//  ScrollController scrollController = ScrollController();
//
//  Future<void> callback() async {
//    if (messageController.text.length > 0) {
//      await _firestore.collection('messageauthor').add({
//        'text': messageController.text,
//        'from': widget.user.email,
//        'date': DateTime.now().toIso8601String().toString(),
//      });
//      messageController.clear();
//      scrollController.animateTo(
//        scrollController.position.maxScrollExtent,
//        curve: Curves.easeOut,
//        duration: const Duration(milliseconds: 300),
//      );
//    }
//  }
//
//////////////////////////////
//
//  Future<bool> _onBackPressed() async => Navigator.maybePop(
//        context,
//        MaterialPageRoute(builder: (context) => MultiPage()),
//      );
//
////////////////////////////////
//
//  @override
//  Widget build(BuildContext context) {
//    return WillPopScope(
//      onWillPop: () => Future.value(true),
//      child: Scaffold(
//        appBar: AppBar(
//          leading: Hero(
//            tag: 'logo',
//            child: Container(
//              height: 40.0,
//              child: Container(
//                child: IconButton(
//                  icon: Icon(Icons.arrow_back),
//                  onPressed: () {
//                    _auth.signOut();
//                    Navigator.push(
//                      context,
//                      BouncyPageRoute(widget: MultiPage()),
//                    );
//                  },
//                ),
//              ),
//            ),
//          ),
//          title: Text('Send me a message'),
//        ),
//        body: SafeArea(
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: <Widget>[
//              Expanded(
//                child: StreamBuilder<QuerySnapshot>(
//                  stream: _firestore
//                      .collection('messageauthor')
//                      .orderBy('date')
//                      .snapshots(),
//                  builder: (context, snapshot) {
//                    if (!snapshot.hasData)
//                      return Center(
//                        child: CircularProgressIndicator(),
//                      );
//
//                    List<DocumentSnapshot> docs = snapshot.data.documents;
//
//                    List<Widget> messages = docs
//                        .map((doc) => Message(
//                              from: doc.data['from'],
//                              text: doc.data['text'],
//                              me: widget.user.email == doc.data['from'],
//                            ))
//                        .toList();
//
//                    return ListView(
//                      controller: scrollController,
//                      children: <Widget>[
//                        ...messages,
//                      ],
//                    );
//                  },
//                ),
//              ),
//              Container(
//                child: Row(
//                  children: <Widget>[
//                    Expanded(
//                      child: TextField(
//                        onSubmitted: (value) => callback(),
//                        decoration: InputDecoration(
//                          hintText: "Enter a Message...",
//                          border: const OutlineInputBorder(),
//                        ),
//                        controller: messageController,
//                      ),
//                    ),
//                    SendButton(
//                      text: "Send",
//                      callback: callback,
//                    )
//                  ],
//                ),
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
