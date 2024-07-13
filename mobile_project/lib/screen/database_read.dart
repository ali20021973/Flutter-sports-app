import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobile_project/screen/home.dart';

import 'intro_screen.dart';
// import 'package:firebase_core/firebase_core.dart';

class Read_Data extends StatelessWidget {
  int _current = 1;
  String word = "";
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
                  context,
                  MaterialPageRoute(
                      builder: (context) => home(
                            email: "aaaaaaaaaaaaaaaaa",
                          ))),
            },
          if (value == 1)
            {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Read_Data())),
            },
          if (value == 2)
            {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const IntroScreen())),
            },
        },
      ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 23, 104, 191),
        title: const Text("the voting news"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('data').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            children: snapshot.data!.docs.map((document) {
              word = document['Id'].toString();
              word += "  : ";
              word += document['text'].toString();

              return Column(
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  // child: Center(child: Text(document['text'])),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 17,
                    width: MediaQuery.of(context).size.width,
                    child: Material(
                      color: Colors.blue[600],
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                        topRight: Radius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            word,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
