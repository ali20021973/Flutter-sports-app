import 'package:flutter/material.dart';
import 'package:mobile_project/screen/intro_screen.dart';
import 'package:mobile_project/screen/table.dart';

import 'auth_screen.dart';
import 'database_read.dart';
import 'database_writing.dart';

class home extends StatelessWidget {
   final String email;
  const home({super.key, required this.email});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(email: this.email,),
    );
  }
}

class HomePage extends StatelessWidget {
  int _current = 0;
   String email;
   HomePage({super.key, required this.email});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _current,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box_outlined),
              label: 'account',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.logout),
              label: 'logout',
            ),
          ],
          onTap: (value) => {
            _current = value,
            if (value == 0)
              {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => home(email: email,))),
              },
            if (value == 1)
              {
                
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => writedata(flag: 0,email:email))),
              },
              if(value==2)
              {
                 Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => IntroScreen())),
              },
          },
        ),
        backgroundColor: Colors.black,
        body: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height / 3.8,
              width: MediaQuery.of(context).size.width,
              child: Card(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                 TableScreen(code: 'FL1',email:this.email,),
                          ));
                    },
                    child: Image.asset('assets/imges/france.png')),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3.2,
              width: MediaQuery.of(context).size.width,
              child: Card(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  TableScreen(code: 'PD',email: this.email,),
                          ));
                    },
                    child: Image.asset('assets/imges/legas.png')),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              child: Card(
                color: Colors.white,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  TableScreen(code: 'PL',email: this.email,),
                          ));
                    },
                    child: Image.asset('assets/imges/premier-league.png')),
              ),
            ),

            // Padding(
          ],
        ));
  }
}
