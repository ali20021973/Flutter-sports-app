import 'package:flutter/material.dart';

class orginalButton extends StatelessWidget {
  final String text;
  final VoidCallback onpress;
  final Color textColor;
  final Color background;
  const orginalButton(
      {Key? key,
      required this.text,
      required this.onpress,
      required this.textColor,
      required this.background})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onpress,
        style: TextButton.styleFrom(foregroundColor: Colors.blue),
        child: Text(text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            )),
      ),
    );
  }
}


