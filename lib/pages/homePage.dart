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
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              GFDrawerHeader(
                currentAccountPicture: GFAvatar(
                  radius: 80.0,
                  backgroundImage: NetworkImage(
                      "https://pbs.twimg.com/profile_images/1174330610946646020/TsTFs6VX_400x400.jpg"),
                ),
                otherAccountsPictures: <Widget>[
                  Image(
                    image: NetworkImage(
                        "https://www.stickpng.com/assets/images/5a7593fc64538c292dec1bbf.png"),
                    fit: BoxFit.cover,
                  ),
                  GFAvatar(
                    child: Text("alek"),
                  )
                ],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('user name'),
                  ],
                ),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: null,
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: null,
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
