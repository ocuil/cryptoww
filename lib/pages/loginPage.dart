import 'package:CryptoWW/providers/login_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: Center(
          child: RaisedButton(
            child: Text('login'),
            onPressed: () {
              Provider.of<LoginState>(context, listen: false).login();
              Navigator.pop(context);
            },
          ),
        ),
      ),
      //onWillPop: null,
      onWillPop: () async => false,
    );
  }
}
