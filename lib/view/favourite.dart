import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<String> favoriteTeams = [];

  @override
  void initState() {
    super.initState();
    _loadFavoriteTeams();
  }

  void _loadFavoriteTeams() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      favoriteTeams = prefs.getStringList('favoriteTeams') ?? [];
    });
  }

  void _removeFavoriteTeam(String teamName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      favoriteTeams.remove(teamName);
      prefs.setStringList('favoriteTeams', favoriteTeams);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Teams'),
      ),
      body: ListView.builder(
        itemCount: favoriteTeams.length,
        itemBuilder: (BuildContext context, int index) {
          final teamName = favoriteTeams[index];
          return ListTile(
            title: Text(teamName),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _removeFavoriteTeam(teamName),
            ),
          );
        },
      ),
    );
  }
}
