import 'package:flutter/material.dart';
import 'artists_page.dart';
import 'single_artist_page.dart';
import 'not_found_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (BuildContext context) {
          return NotFoundPage();
        });
      },
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case MyHomePage.routeName:
            return MaterialPageRoute(builder: (BuildContext context) {
              return MyHomePage();
            });
          case ArtistsPage.routeName:
            return MaterialPageRoute(builder: (BuildContext context) {
              return ArtistsPage();
            });
          case SingleArtistsPage.routeName:
            final args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(builder: (BuildContext context) {
              return SingleArtistsPage(
                about: args['about'],
                name: args['name'],
              );
            });
        }
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentSelected = 0;

  void selectDestination(int index) {
    setState(() {
      _currentSelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home page'),
        ),
        drawer: Drawer(
          child: SafeArea(
            child:
                Column(
              children: [
                ListTile(
                  selected: _currentSelected == 0,
                  title: Text(
                    'Home',
                  ),
                  leading: Icon(Icons.home),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    selectDestination(0);
                    Navigator.of(context).pop(); // Заменил Navigator.of(context).pushNamed
                  },
                ),
                ListTile(
                  selected: _currentSelected == 1,
                  title: Text('Artists'),
                  leading: Icon(Icons.person),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    selectDestination(1);
                    Navigator.of(context).pushNamed('/artists'); // если заменить на  Navigator.of(context).pushNamedAndRemoveUntil(('/artists'), (route) => false)
                  },                                             // то исчезает кнопка "назад" на странице artists. а как вернуться?
                ),
              ],
            ),
          ),
        ),
        body: Center(
          child: Text(''),
        ));
  }
}
