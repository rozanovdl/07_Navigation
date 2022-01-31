import 'package:flutter/material.dart';

Widget myGradientButton(buttonName, onPressedRoute, context, aboutArtist) {
  return (ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Stack(children: <Widget>[
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color(0xFF174592),
                  Color(0xFF287DD2),
                  Color(0xFF5BA5F5),
                ],
              ),
            ),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(25.0),
            primary: Colors.white,
            textStyle: const TextStyle(fontSize: 18),
          ),
          onPressed: () {
            Navigator.of(context).pushNamed(onPressedRoute, arguments: {'name': '$buttonName', 'about': '$aboutArtist'});
          },
          child: Text(buttonName),
        )
      ])));
}
