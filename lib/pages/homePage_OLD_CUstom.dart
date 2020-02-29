import 'package:CryptoWW/providers/login_state.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'splashPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<LoginState>(context);
    if (!state.isLogggedIn()) {
      return MaterialApp(
        home: SplashPage(),
      );
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
        child: Scaffold(
          backgroundColor: Color.fromRGBO(25, 27, 42, 1.0),
          appBar: AppBar(
            title: const Text('Crypto Witnet Wallet',
                style: TextStyle(color: Color.fromRGBO(69, 194, 218, 1.0))),
            automaticallyImplyLeading: false,
            backgroundColor: Color.fromRGBO(41, 42, 62, 1.0),
            elevation: 10.0,
          ),
          drawer: GFDrawer(
            color: Color.fromRGBO(25, 27, 42, 1.0),
            child: Column(
              children: <Widget>[
                GFDrawerHeader(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(41, 42, 62, 1.0),
                  ),
                  currentAccountPicture: GFAvatar(
                    radius: 80.0,
                    backgroundImage: NetworkImage(state.userLogin.photoUrl),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        state.userLogin.displayName,
                        style: TextStyle(
                          color: Color.fromRGBO(69, 194, 218, 1.0),
                        ),
                      ),
                      Text(
                        state.userLogin.email,
                        style: TextStyle(
                          color: Color.fromRGBO(69, 194, 218, 1.0),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Divider(),
                          ListTile(
                            leading: Icon(
                              Icons.exit_to_app,
                              color: Color.fromRGBO(69, 194, 218, 1.0),
                            ),
                            title: const Text(
                              'Exit',
                              style: TextStyle(
                                color: Color.fromRGBO(69, 194, 218, 1.0),
                              ),
                            ),
                            onTap: () {
                              Provider.of<LoginState>(context, listen: false)
                                  .logout();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: Center(
            child: Column(
              children: <Widget>[],
            ),
          ),
          // bottomNavigationBar: new BottomNavigationBar(
          //     backgroundColor: Color.fromRGBO(41, 42, 62, 1.0),
          //     fixedColor: Color.fromRGBO(69, 194, 218, 1.0),
          //     items: [
          //       new BottomNavigationBarItem(
          //         icon: new Icon(Icons.home),
          //         title: new Text("Home"),
          //       ),
          //       new BottomNavigationBarItem(
          //         icon: new Icon(Icons.people),
          //         title: new Text("Community"),
          //       ),
          //       new BottomNavigationBarItem(
          //         icon: new Icon(Icons.settings),
          //         title: new Text("Setup"),
          //       )
          //     ]),
        ),
        onWillPop: () async => false,
      ),
    );
  }
}
