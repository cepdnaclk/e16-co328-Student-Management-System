import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:mobile_app_for_students/services/data_fetch.dart';

const users = {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

class LoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String> _addUser(LoginData data) async {
    print('Name: ${data.name}, Password: ${data.password}');

    if (await DataFetch.addUser(data.name, data.password)) {
      return '';
    } else {
      return 'Something went wrong. Please try again';
    }
  }

  Future<String> _authUser(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}');
    return DataFetch.loginUser(data.name, data.password);
  }

  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'ECORP',
      // logo: 'assets/images/ecorp-lightblue.png',
      onLogin: _authUser,
      onSignup: _addUser,
      onSubmitAnimationCompleted: () {
        Navigator.popAndPushNamed(context, '/home');
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
