import 'package:flutter/material.dart';

class SingleArtistsPage extends StatefulWidget {
  SingleArtistsPage({Key? key, required this.name, required this.about})
      : super(key: key);
  final String name;
  final String about;
  static const routeName = '/singlArtist';

  @override
  _SingleArtistPageState createState() => _SingleArtistPageState();
}

class _SingleArtistPageState extends State<SingleArtistsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${widget.name}'),
        ),
        body: SafeArea(child:
        Container(
            child: SingleChildScrollView(
                child: Text('${widget.about}')))));
  }
}
