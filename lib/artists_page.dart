import 'package:flutter/material.dart';
import 'package:albums_route/schema_artists.dart';
import 'fetch_file.dart';
import 'buttons.dart';

class ArtistsPage extends StatefulWidget {
  ArtistsPage({Key? key}) : super(key: key);
  static const routeName = '/artists';
  @override
  _ArtistPageState createState() => _ArtistPageState();
}

class _ArtistPageState extends State<ArtistsPage> {
  final Future<List<Artist>> _fetchFile = fetchFileFromAssets('assets/artists.json');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: FutureBuilder(
          future: _fetchFile,
          builder: (context, data) {
            if (data.hasError) {
              return Center(child: Text("${data.error}"));
            } else if (data.hasData) {
              var items = data.data as List<Artist>;
              return ListView.builder(
                  itemCount: (items.length),
                  itemBuilder: (context, index) {
                    return Card(
                        child: myGradientButton(
                            items[index].name.toString(),
                            '/singlArtist',
                            context,
                            items[index].about.toString()));
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )));
  }
}
