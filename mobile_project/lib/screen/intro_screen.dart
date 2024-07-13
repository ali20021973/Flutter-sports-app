import 'package:flutter/material.dart';
import 'package:mobile_project/screen/auth_screen.dart';
import 'package:mobile_project/widgets/orgnal_button.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const SizedBox(),
              Image.asset('assets/imges/imges.png'),
              orginalButton(
                text: 'Get Started',
                onpress: () => {
                   
              {
                    Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AuthScreen(authType: AuthType.login,))),
              },
                },
                textColor: Colors.white,
                background: Colors.lightBlue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
