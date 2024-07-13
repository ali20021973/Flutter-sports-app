import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobile_project/screen/home.dart';
import 'package:mobile_project/screen/intro_screen.dart';
import 'package:mobile_project/screen/slider.dart';

import 'database_read.dart';
import 'message_bubb.dart';

class writedata extends StatefulWidget {
  final int flag;
  final String email;
  const writedata({super.key, required this.flag, required this.email});

  @override
  State<writedata> createState() =>
      _writedataState(flag: this.flag, email: this.email);
}

class _writedataState extends State<writedata> {
  final int flag;
  final String email;

  _writedataState({required this.flag, required this.email});
  String? _vote = '';
  int current = 0;
  int _current = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent[300],
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
                              email: "aaaaaaaaaaaaaa",
                            ))),
              },
            if (value == 2)
              {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const IntroScreen())),
              },
          },
        ),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 23, 104, 191),
          title: const Text("Put your vote"),
        ),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
           
            CarouselSlider(
              items: [
                Container(
                  margin: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: const DecorationImage(
                      image: AssetImage('assets/imges/Nike.png'),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: const DecorationImage(
                      image: AssetImage('assets/imges/cr7-united.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: const DecorationImage(
                      image: AssetImage('assets/imges/cr7_port.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: const DecorationImage(
                      image: AssetImage('assets/imges/cr7.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    image: const DecorationImage(
                      image: AssetImage('assets/imges/cr7-united.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],

              //Slider Container properties
              options: CarouselOptions(
                height: 300,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                viewportFraction: 0.7,
              ),
            ),
          ]),
        ));
  }
}
