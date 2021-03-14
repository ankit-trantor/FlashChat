import 'package:flutter/material.dart';

class RoundedButtons extends StatelessWidget {
  RoundedButtons({this.text, this.colour, this.onpressed});
  final String text;
  final Color colour;
  final Function onpressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14),
      child: Material(
        elevation: 15,
        color: colour,
        borderRadius: BorderRadius.circular(20),
        child: MaterialButton(
          onPressed: onpressed,
          minWidth: 200,
          height: 40,
          child: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
