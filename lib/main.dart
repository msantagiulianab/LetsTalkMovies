import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multiroomchat/BouncyPageRoute.dart';
import 'package:multiroomchat/SlideRightRoute.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'let\'s talk MOVIES',
      theme: ThemeData.dark(),
      initialRoute: MyHomePage.id,
      routes: {
        MyHomePage.id: (context) => MyHomePage(),
        Registration.id: (context) => Registration(),
        Login.id: (context) => Login(),
        BestOfChat01.id: (context) => BestOfChat01(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  static const String id = "HOMESCREEN";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  width: 100.0,
                  child: Image.asset("assets/icon.png"),
                ),
              ),
              Text(
                "let\'s talk\nMOVIES",
                style: TextStyle(
                  fontSize: 36.0,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50.0,
          ),
          CustomButton(
            text: "Log In",
            callback: () {
              Navigator.of(context).pushNamed(Login.id);
            },
          ),
          CustomButton(
            text: "Register",
            callback: () {
              Navigator.of(context).pushNamed(Registration.id);
            },
          )
        ],
      ),
    );
  }
}

String email;
String password;

final FirebaseAuth _auth = FirebaseAuth.instance;

class CustomButton extends StatelessWidget {
  final VoidCallback callback;
  final String text;

  const CustomButton({Key key, this.callback, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Colors.blueGrey,
        elevation: 6.0,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: callback,
          minWidth: 200.0,
          height: 45.0,
          child: Text(text),
        ),
      ),
    );
  }
}

class Registration extends StatefulWidget {
  static const String id = "REGISTRATION";

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  Future<void> registerUser() async {
    FirebaseUser user = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    Navigator.push(
      context,
      SlideRightRoute(page: MultiPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("let\'s talk\nMOVIES"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Hero(
              tag: 'logo',
              child: Container(
                child: Image.asset(
                  "assets/icon.png",
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) => email = value,
            decoration: InputDecoration(
              hintText: "Enter Your Email...",
              border: const OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          TextField(
            autocorrect: false,
            obscureText: true,
            onChanged: (value) => password = value,
            decoration: InputDecoration(
              hintText: "Enter Your Password...",
              border: const OutlineInputBorder(),
            ),
          ),
          CustomButton(
            text: "Register",
            callback: () async {
              await registerUser();
            },
          )
        ],
      ),
    );
  }
}

class Login extends StatefulWidget {
  static const String id = "LOGIN";

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Future<void> loginUser() async {
    FirebaseUser user = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    Navigator.push(
      context,
      SlideRightRoute(page: MultiPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("let\'s talk\nMOVIES"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Hero(
              tag: 'logo',
              child: Container(
                child: Image.asset(
                  "assets/icon.png",
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) => email = value,
            decoration: InputDecoration(
              hintText: "Enter Your Email...",
              border: const OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          TextField(
            autocorrect: false,
            obscureText: true,
            onChanged: (value) => password = value,
            decoration: InputDecoration(
              hintText: "Enter Your Password...",
              border: const OutlineInputBorder(),
            ),
          ),
          CustomButton(
            text: "Log In",
            callback: () async {
              await loginUser();
            },
          )
        ],
      ),
    );
  }
}

class MultiPage extends StatefulWidget {
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MultiPage> with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollController;

  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    _scrollController = new ScrollController();
  }

  static Future<void> pop({bool animated}) async {
    await SystemChannels.platform
        .invokeMethod<void>('SystemNavigator.pop', animated);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool InnerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                actions: <Widget>[
                  Container(
                    width: 20.0,
                  ),
                  new IconButton(
                    icon: new Icon(Icons.exit_to_app),
                    onPressed: () => pop(),
                  ),
                  Container(
                    width: 20.0,
                  ),
                ],
                pinned: true,
                floating: true,
                centerTitle: false,
                backgroundColor: Colors.blueGrey,
                title: Text('let\'s talk MOVIES'),
                bottom: TabBar(
                    indicatorWeight: 5.0,
                    indicatorColor: Colors.white,
                    controller: _tabController,
                    tabs: [
                      Tab(
                        text: 'Best of 2019\n(Rotten Tomatoes)',
                      ),
                      Tab(
                        text: 'Links',
                      )
                    ]),
              )
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: <Widget>[BestOf(), Links()],
          ),
        ),
      ),
    );
  }
}

class BestOf extends StatefulWidget {
  BestOfState createState() => BestOfState();
}

class BestOfState extends State<BestOf> {
//  final flag = false;

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
            title: Text('Avengers: Endgame'),
            subtitle: Text('#1'),
            onTap: () async {
              FirebaseUser user = await _auth.signInWithEmailAndPassword(
                email: email,
                password: password,
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BestOfChat01(
                    user: user,
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
            title: Text('US'),
            subtitle: Text('#2'),
            onTap: () async {
//              await startChat();

              FirebaseUser user = await _auth.signInWithEmailAndPassword(
                email: email,
                password: password,
              );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BestOfChat02(
                    user: user,
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
            title: Text('TOY STORY 4'),
            subtitle: Text('#3'),
            onTap: () async {
              FirebaseUser user = await _auth.signInWithEmailAndPassword(
                email: email,
                password: password,
              );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BestOfChat03(
                    user: user,
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
            title: Text('KNIVES OUT'),
            subtitle: Text('#4'),
            onTap: () async {
              FirebaseUser user = await _auth.signInWithEmailAndPassword(
                email: email,
                password: password,
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BestOfChat04(
                    user: user,
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
            title: Text('BOOKSMART'),
            subtitle: Text('#5'),
            onTap: () async {
//              await startChat();

              FirebaseUser user = await _auth.signInWithEmailAndPassword(
                email: email,
                password: password,
              );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BestOfChat05(
                    user: user,
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
            title: Text('The Farewell'),
            subtitle: Text('#6'),
            onTap: () async {
              FirebaseUser user = await _auth.signInWithEmailAndPassword(
                email: email,
                password: password,
              );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BestOfChat06(
                    user: user,
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
            title: Text('Spider-Man: Far From Home'),
            subtitle: Text('#7'),
            onTap: () async {
              FirebaseUser user = await _auth.signInWithEmailAndPassword(
                email: email,
                password: password,
              );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BestOfChat07(
                    user: user,
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
            title: Text('Once Upon a Time In Hollywood'),
            subtitle: Text('#8'),
            onTap: () async {
              FirebaseUser user = await _auth.signInWithEmailAndPassword(
                email: email,
                password: password,
              );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BestOfChat08(
                    user: user,
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
            title: Text('SHAZAM!'),
            subtitle: Text('#9'),
            onTap: () async {
              FirebaseUser user = await _auth.signInWithEmailAndPassword(
                email: email,
                password: password,
              );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BestOfChat09(
                    user: user,
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
            title: Text('LITTLE WOMEN'),
            subtitle: Text('#10'),
            onTap: () async {
              FirebaseUser user = await _auth.signInWithEmailAndPassword(
                email: email,
                password: password,
              );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BestOfChat10(
                    user: user,
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

              FirebaseUser user = await _auth.signInWithEmailAndPassword(
                email: email,
                password: password,
              );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MessageAuthor(
                    user: user,
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

class SendButton extends StatelessWidget {
  final String text;
  final VoidCallback callback;

  const SendButton({Key key, this.text, this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.all(20),
      color: Colors.blueGrey[400],
      onPressed: callback,
      icon: Icon(Icons.send),
    );
  }
}

class Message extends StatelessWidget {
  final String from;
  final String text;

  final bool me;

  const Message({Key key, this.from, this.text, this.me}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment:
            me ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            from,
          ),
          Material(
            color: me ? Colors.teal : Colors.red,
            borderRadius: BorderRadius.circular(10.0),
            elevation: 6.0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: Text(
                text,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BestOfChat01 extends StatefulWidget {
  static const String id = "CHAT";
  final FirebaseUser user;

  const BestOfChat01({Key key, this.user}) : super(key: key);

  @override
  _BestOfChat01State createState() => _BestOfChat01State();
}

class _BestOfChat01State extends State<BestOfChat01> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;

  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();

  Future<void> callback() async {
    if (messageController.text.length > 0) {
      await _firestore.collection('bestof01').add({
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

////////////////////////////

  Future<bool> _onBackPressed() async => Navigator.maybePop(
        context,
        MaterialPageRoute(builder: (context) => MultiPage()),
      );

//////////////////////////////

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
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
          title: Text('Avengers: Endgame'),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: _firestore
                      .collection('bestof01')
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

class BestOfChat02 extends StatefulWidget {
  static const String id = "CHAT";
  final FirebaseUser user;

  const BestOfChat02({Key key, this.user}) : super(key: key);

  @override
  _BestOfChat02State createState() => _BestOfChat02State();
}

class _BestOfChat02State extends State<BestOfChat02> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;

  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();

  Future<void> callback() async {
    if (messageController.text.length > 0) {
      await _firestore.collection('bestof02').add({
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

////////////////////////////

  Future<bool> _onBackPressed() async => Navigator.maybePop(
        context,
        MaterialPageRoute(builder: (context) => MultiPage()),
      );

//////////////////////////////

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
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
          title: Text('US'),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: _firestore
                      .collection('bestof02')
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

class BestOfChat03 extends StatefulWidget {
  static const String id = "CHAT";
  final FirebaseUser user;

  const BestOfChat03({Key key, this.user}) : super(key: key);

  @override
  _BestOfChat03State createState() => _BestOfChat03State();
}

class _BestOfChat03State extends State<BestOfChat03> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;

  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();

  Future<void> callback() async {
    if (messageController.text.length > 0) {
      await _firestore.collection('bestof03').add({
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

////////////////////////////

  Future<bool> _onBackPressed() async => Navigator.maybePop(
        context,
        MaterialPageRoute(builder: (context) => MultiPage()),
      );

//////////////////////////////

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
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
          title: Text('TOY STORY 4'),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: _firestore
                      .collection('bestof03')
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

class BestOfChat04 extends StatefulWidget {
  static const String id = "CHAT";
  final FirebaseUser user;

  const BestOfChat04({Key key, this.user}) : super(key: key);

  @override
  _BestOfChat04State createState() => _BestOfChat04State();
}

class _BestOfChat04State extends State<BestOfChat04> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;

  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();

  Future<void> callback() async {
    if (messageController.text.length > 0) {
      await _firestore.collection('bestof04').add({
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

////////////////////////////

  Future<bool> _onBackPressed() async => Navigator.maybePop(
        context,
        MaterialPageRoute(builder: (context) => MultiPage()),
      );

//////////////////////////////

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
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
          title: Text('KNIVES OUT'),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: _firestore
                      .collection('bestof04')
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

class BestOfChat05 extends StatefulWidget {
  static const String id = "CHAT";
  final FirebaseUser user;

  const BestOfChat05({Key key, this.user}) : super(key: key);

  @override
  _BestOfChat05State createState() => _BestOfChat05State();
}

class _BestOfChat05State extends State<BestOfChat05> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;

  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();

  Future<void> callback() async {
    if (messageController.text.length > 0) {
      await _firestore.collection('bestof05').add({
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

////////////////////////////

  Future<bool> _onBackPressed() async => Navigator.maybePop(
        context,
        MaterialPageRoute(builder: (context) => MultiPage()),
      );

//////////////////////////////

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
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
          title: Text('BOOKSMART'),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: _firestore
                      .collection('bestof05')
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

class BestOfChat06 extends StatefulWidget {
  static const String id = "CHAT";
  final FirebaseUser user;

  const BestOfChat06({Key key, this.user}) : super(key: key);

  @override
  _BestOfChat06State createState() => _BestOfChat06State();
}

class _BestOfChat06State extends State<BestOfChat06> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;

  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();

  Future<void> callback() async {
    if (messageController.text.length > 0) {
      await _firestore.collection('bestof06').add({
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

////////////////////////////

  Future<bool> _onBackPressed() async => Navigator.maybePop(
        context,
        MaterialPageRoute(builder: (context) => MultiPage()),
      );

//////////////////////////////

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
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
          title: Text('The Farewell'),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: _firestore
                      .collection('bestof06')
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

class BestOfChat07 extends StatefulWidget {
  static const String id = "CHAT";
  final FirebaseUser user;

  const BestOfChat07({Key key, this.user}) : super(key: key);

  @override
  _BestOfChat07State createState() => _BestOfChat07State();
}

class _BestOfChat07State extends State<BestOfChat07> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;

  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();

  Future<void> callback() async {
    if (messageController.text.length > 0) {
      await _firestore.collection('bestof07').add({
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

////////////////////////////

  Future<bool> _onBackPressed() async => Navigator.maybePop(
        context,
        MaterialPageRoute(builder: (context) => MultiPage()),
      );

//////////////////////////////

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
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
          title: Text('Spider-Man: Far From Home'),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: _firestore
                      .collection('bestof07')
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

class BestOfChat08 extends StatefulWidget {
  static const String id = "CHAT";
  final FirebaseUser user;

  const BestOfChat08({Key key, this.user}) : super(key: key);

  @override
  _BestOfChat08State createState() => _BestOfChat08State();
}

class _BestOfChat08State extends State<BestOfChat08> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;

  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();

  Future<void> callback() async {
    if (messageController.text.length > 0) {
      await _firestore.collection('bestof08').add({
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

////////////////////////////

  Future<bool> _onBackPressed() async => Navigator.maybePop(
        context,
        MaterialPageRoute(builder: (context) => MultiPage()),
      );

//////////////////////////////

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
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
          title: Text('Once Upon a Time In Hollywood'),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: _firestore
                      .collection('bestof08')
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

class BestOfChat09 extends StatefulWidget {
  static const String id = "CHAT";
  final FirebaseUser user;

  const BestOfChat09({Key key, this.user}) : super(key: key);

  @override
  _BestOfChat09State createState() => _BestOfChat09State();
}

class _BestOfChat09State extends State<BestOfChat09> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;

  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();

  Future<void> callback() async {
    if (messageController.text.length > 0) {
      await _firestore.collection('bestof09').add({
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

////////////////////////////

  Future<bool> _onBackPressed() async => Navigator.maybePop(
        context,
        MaterialPageRoute(builder: (context) => MultiPage()),
      );

//////////////////////////////

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
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
          title: Text('SHAZAM!'),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: _firestore
                      .collection('bestof09')
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

class BestOfChat10 extends StatefulWidget {
  static const String id = "CHAT";
  final FirebaseUser user;

  const BestOfChat10({Key key, this.user}) : super(key: key);

  @override
  _BestOfChat10State createState() => _BestOfChat10State();
}

class _BestOfChat10State extends State<BestOfChat10> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;

  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();

  Future<void> callback() async {
    if (messageController.text.length > 0) {
      await _firestore.collection('bestof10').add({
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

////////////////////////////

  Future<bool> _onBackPressed() async => Navigator.maybePop(
        context,
        MaterialPageRoute(builder: (context) => MultiPage()),
      );

//////////////////////////////

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
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
          title: Text("LITTLE WOMEN"),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: _firestore
                      .collection('bestof10')
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

class MessageAuthor extends StatefulWidget {
  static const String id = "CHAT";
  final FirebaseUser user;

  const MessageAuthor({Key key, this.user}) : super(key: key);

  @override
  _MessageAuthorState createState() => _MessageAuthorState();
}

class _MessageAuthorState extends State<MessageAuthor> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;

  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();

  Future<void> callback() async {
    if (messageController.text.length > 0) {
      await _firestore.collection('messageauthor').add({
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

////////////////////////////

  Future<bool> _onBackPressed() async => Navigator.maybePop(
        context,
        MaterialPageRoute(builder: (context) => MultiPage()),
      );

//////////////////////////////

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
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
          title: Text('...message to\nthe author'),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: _firestore
                      .collection('messageauthor')
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
