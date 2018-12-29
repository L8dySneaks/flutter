import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';


void main() => runApp(const FamilyApp());

class FamilyApp extends StatelessWidget {
  const FamilyApp();
  // Root application widget
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        buttonColor: Colors.purple,
        buttonTheme: const ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: FamilyHomePage(),
    );
  }
}



// create a class that holds player data
class Player {
  const Player({this.name, this.hometown, this.number, this.imageUrl, this.warmupSong});

  final String name;
  final String hometown;
  final int number;
  final String imageUrl;
  final String warmupSong;
}

// add global string for emulators
final String server =
    defaultTargetPlatform == TargetPlatform.android ? "199.30.194.254" : "localhost";

final List<Player> _players = <Player>[
  Player (
    name: 'Steph',
    hometown: 'Bridgeville',
    number: 78,
    // imageUrl: 'http://$server:8000/kitten1.jpg',
    imageUrl: 'https://via.placeholder.com/150x150.png?text=StephPlayerImg',
    warmupSong: "Back to Life"
  ),
  Player (
    name: 'Jenn',
    hometown: 'Gulfport',
    number: 22,
    // imageUrl: 'http://$server:8000/kitten2.jpg',
    imageUrl: 'https://via.placeholder.com/150x150.png?text=JennPlayerImg',
    warmupSong: "IDGAF"
  )
];

class FamilyHomePage extends StatelessWidget {
  const FamilyHomePage({Key key}) : super(key: key);

  //define the dialog builder function
  Widget _dialogBuilder(BuildContext context, Player player) {
    //cache a local copy of the Theme widget since it will be use multiple times
    ThemeData localTheme = Theme.of(context);


    return SimpleDialog(
      contentPadding: EdgeInsets.zero,
      children: [
        Image.network(
          player.imageUrl,
          fit: BoxFit.fill
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                player.name,
                style: localTheme.textTheme.display1,
              ),
              Text(
                'Number : ${player.number}',
                style: localTheme.textTheme.subhead.copyWith(
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Hometown : ${player.hometown}',
                style: localTheme.textTheme.body1,
              ),
              Text(
                'Warm-up Song : ${player.warmupSong}',
                style: localTheme.textTheme.body1,
              ),
              SizedBox(height: 16.0,),
              Align(
                alignment: Alignment.centerRight,
                  child: Wrap(
                    children: [
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('I\'M ALLERGIC'),
                      ),
                      RaisedButton(
                        onPressed: () {},
                        child: const Text('ADOPT ME'),
                      ),
                    ],
                  ),
              ),
            ],
          ),
          )
      ]);
  }

  Widget _listItemBuilder(BuildContext context, int index) {
    return GestureDetector(
      onTap: () =>
        showDialog(context: context,
        builder: (context) => _dialogBuilder(context, _players[index])),
          child: Container(
        padding: const EdgeInsets.only(left: 16.0),
        alignment: Alignment.centerLeft,
        child: Text(_players[index].name,
          style: Theme.of(context).textTheme.headline),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Family Foursqaure'),
      ),
      body: ListView.builder(
        itemCount: _players.length,
        itemExtent: 60.0,
        itemBuilder: _listItemBuilder,
      ),
    );
  }
}