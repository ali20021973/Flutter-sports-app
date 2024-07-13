import 'package:flutter/material.dart';

class LeagueContainer extends StatelessWidget {
  final String image;

  const LeagueContainer({Key? key, required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical:20),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 161, 23, 23),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Image.asset(image),
    );
  }
}