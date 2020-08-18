import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'bestof.dart';
import 'links.dart';

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
