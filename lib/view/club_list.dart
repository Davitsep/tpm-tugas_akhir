import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'detailPage.dart';

class FootballDataPage extends StatefulWidget {
  @override
  _FootballDataPageState createState() => _FootballDataPageState();
}

class _FootballDataPageState extends State<FootballDataPage> {
  String _apiToken =
      '2b90407305e24d93b05532bbca441e39'; // Ganti dengan token API Anda
  List<dynamic> _teams = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(
      Uri.parse('http://api.football-data.org/v4/teams'),
      headers: {
        'X-Auth-Token': _apiToken,
      },
    );

    if (response.statusCode == 200) {
      setState(() {
        _teams = json.decode(response.body)['teams'];
      });
    } else {
      throw Exception('Gagal mengambil data dari API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Football Data'),
      ),
      body: ListView.builder(
        itemCount: _teams.length,
        itemBuilder: (BuildContext context, int index) {
          final team = _teams[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailPage(
                            team: team,
                          )));
            },
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(team['crest'].toString()),
                ),
                title: Text(team['name'].toString()),
              ),
            ),
          );

          // return ListTile(
          //   leading: CircleAvatar(
          //     backgroundImage: NetworkImage(team['crest'].toString()),
          //   ),
          //   title: Text(team['name'].toString()),
          // );
        },
      ),
    );
  }
}
