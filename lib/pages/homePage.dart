import 'dart:async';

import 'package:CryptoWW/providers/login_state.dart';
import 'package:CryptoWW/utils/style.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:shimmer/shimmer.dart';
import 'package:getflutter/getflutter.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'splashPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loadCard = true;

  @override
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      setState(() {
        loadCard = false;
      });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    final state = Provider.of<LoginState>(context);
    if (!state.isLogggedIn()) {
      return MaterialApp(
        home: SplashPage(),
      );
    }
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 27, 42, 1.0),
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
                height: 210.0,
                width: double.infinity,
                child: new Carousel(
                  boxFit: BoxFit.cover,
                  dotColor: Colors.white.withOpacity(0.8),
                  dotSize: 5.5,
                  dotSpacing: 16.0,
                  dotBgColor: Colors.transparent,
                  showIndicator: true,
                  overlayShadow: true,
                  // overlayShadowColors: Theme.of(context)
                  //     .scaffoldBackgroundColor
                  //     .withOpacity(0.9),
                  overlayShadowColors:
                      Color.fromRGBO(25, 27, 42, 1.0).withOpacity(0.9),
                  overlayShadowSize: 0.25,
                  images: [
                    AssetImage("assets/banner2.png"),
                    AssetImage("assets/banner3.jpg"),
                    AssetImage("assets/banner2.png"),
                    AssetImage("assets/banner3.jpg"),
                  ],
                )),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
