import 'package:CryptoWW/providers/login_state.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<LoginState>(context);
    return WillPopScope(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(66, 165, 245, 1.0),
        appBar: AppBar(
          title: Text('Crypto WW'),
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromRGBO(37, 117, 252, 1.0),
          elevation: 10.0,
        ),
        drawer: GFDrawer(
          color: Color.fromRGBO(66, 165, 245, 1.0),
          child: Column(
            //padding: EdgeInsets.zero,
            children: <Widget>[
              GFDrawerHeader(
                currentAccountPicture: GFAvatar(
                  radius: 80.0,
                  backgroundImage: NetworkImage(state.userLogin.photoUrl),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(state.userLogin.displayName),
                    Text(state.userLogin.email),
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
                          leading: Icon(Icons.exit_to_app),
                          title: Text('Exit'),
                          onTap: () {
                            Navigator.pop(context);
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
        bottomNavigationBar: new BottomNavigationBar(
            backgroundColor: Color.fromRGBO(37, 117, 252, 1.0),
            fixedColor: Color.fromRGBO(255, 255, 255, 1.0),
            items: [
              new BottomNavigationBarItem(
                icon: new Icon(Icons.home),
                title: new Text("Home"),
              ),
              new BottomNavigationBarItem(
                icon: new Icon(Icons.people),
                title: new Text("Community"),
              ),
              new BottomNavigationBarItem(
                icon: new Icon(Icons.settings),
                title: new Text("Setup"),
              )
            ]),
      ),
      onWillPop: () async => false,
    );
  }
}
