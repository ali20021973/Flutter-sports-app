import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_project/screen/home.dart';
import 'package:mobile_project/screen/intro_screen.dart';
import 'package:mobile_project/servises/auth.dart';

import '../screen/auth_screen.dart';
import 'orgnal_button.dart';

class AuthForm extends StatefulWidget {
  final AuthType authType;

  const AuthForm({Key? key, required this.authType}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey();
  String _email = '', _password = '';
  int flag_cheak = 0;
  AuthenticationHelper obj = AuthenticationHelper();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (value) {
                  _email = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Enter your Email',
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                onChanged: (value) {
                  _password = value;
                },
                validator: (value) => value != null
                    ? value.length < 6
                        ? 'your password must be large 6 number'
                        : null
                    : null,
                decoration: const InputDecoration(
                  labelText: 'Enter your Password',
                ),
                obscureText: true,
              ),
              const SizedBox(
                height: 12,
              ),
              orginalButton(
                text: widget.authType == AuthType.login ? 'login ' : 'register',
                onpress: () async {
                  if (_email != ' ') {
                    if (_password != ' ') {
                      if (widget.authType == AuthType.login) {
                        AuthenticationHelper()
                            .handleSignInEmail(_email, _password)
                            .then(
                          (User user) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => home(
                                          email: _email,
                                        )));
                          },
                        );
                        flag_cheak = 1;
                      } else {
                        if (_email != ' ') {
                          obj.signUp(_email, _password);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => home(
                                        email: _email,
                                      )));
                        }
                      }
                    }
                  }
                },
                textColor: Colors.lightBlue,
                background: Colors.white,
              ),
              TextButton(
                onPressed: () {
                  if (widget.authType == AuthType.login) {
                    Navigator.of(context).pushReplacementNamed('register');
                  } else {
                    Navigator.of(context).pushReplacementNamed('login');
                  }
                },
                child: Text(
                  widget.authType == AuthType.login
                      ? 'Dont \t have an account?'
                      : 'you have accout',
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                  ),
                ),
              )
            ]),
          ),
        ),
      ],
    );
  }
}
