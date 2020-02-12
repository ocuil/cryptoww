import 'dart:async';

import 'package:CryptoWW/pages/homePage.dart';
import 'package:CryptoWW/providers/login_state.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:CryptoWW/utils/delayed_animation.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  final int delayedAmount = 500;
  double _scale;
  AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<LoginState>(context);
    if (state.isLogggedIn()) {
      return MaterialApp(
        home: HomePage(),
      );
    }
    final color = Colors.white;
    _scale = 1 - _controller.value;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(66, 165, 245, 1.0),
        body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 60,
              ),
              AvatarGlow(
                endRadius: 90,
                duration: Duration(seconds: 2),
                glowColor: Colors.white24,
                repeat: true,
                repeatPauseDuration: Duration(seconds: 2),
                startDelay: Duration(seconds: 1),
                child: Material(
                    elevation: 8.0,
                    shape: CircleBorder(),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[100],
                      child: new Image.asset(
                        'assets/logo.png',
                        height: 90.0,
                        fit: BoxFit.cover,
                      ),
                      radius: 50.0,
                    )),
              ),
              DelayedAnimation(
                child: Text(
                  "Hi There",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35.0,
                      color: color),
                ),
                delay: delayedAmount + 1000,
              ),
              SizedBox(
                height: 20,
              ),
              DelayedAnimation(
                child: Text(
                  "I'm Crypto",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0,
                      color: color),
                ),
                delay: delayedAmount + 2000,
              ),
              SizedBox(
                height: 50.0,
              ),
              DelayedAnimation(
                child: Text(
                  "Your mobile Wallet",
                  style: TextStyle(fontSize: 20.0, color: color),
                ),
                delay: delayedAmount + 3000,
              ),
              DelayedAnimation(
                child: Text(
                  "to the witnet network",
                  style: TextStyle(fontSize: 20.0, color: color),
                ),
                delay: delayedAmount + 3000,
              ),
              SizedBox(
                height: 100.0,
              ),
              DelayedAnimation(
                child: GestureDetector(
                  onTapDown: _onTapDown,
                  onTapUp: (details) {
                    _onTapUp(details);
                    if (state.isLogggedIn()) {
                      Timer(Duration(seconds: 1), () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      });
                    } else {
                      Timer(Duration(seconds: 1), () {
                        Provider.of<LoginState>(context, listen: false).login();
                      });
                    }
                  },
                  child: Transform.scale(
                    scale: _scale,
                    child: _animatedButtonUI,
                  ),
                ),
                delay: delayedAmount + 4000,
              ),
              SizedBox(
                height: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _animatedButtonUI => Container(
        height: 60,
        width: 270,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            'Enter',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(66, 165, 245, 1.0),
              //color: Color(0xFF8185E2),
            ),
          ),
        ),
      );

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }
}
