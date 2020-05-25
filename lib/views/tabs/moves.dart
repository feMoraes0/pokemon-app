import 'package:flutter/material.dart';
import 'package:pokemon_app/components/loading.dart';
import 'package:pokemon_app/services/network_helper.dart';

const kTotalMoves = 746;

class Moves extends StatefulWidget {
  @override
  _MovesState createState() => _MovesState();
}

class _MovesState extends State<Moves> {
  List _moves;

  @override
  void initState() {
    super.initState();
    this._moves = [];
    this.getMovesData();
  }

  void getMovesData() async {
    NetWorkHelper network = NetWorkHelper(
      url: 'https://pokeapi.co/api/v2/move?offset=0&limit=$kTotalMoves',
    );
    dynamic data = await network.getData();

    if (mounted) {
      setState(() {
        this._moves = data['results'];
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (this._moves.length == 0)
        ? Loading()
        : ListView.builder(
            itemCount: this._moves.length,
            itemBuilder: (context, index) {
              Map move = this._moves[index];
              return Column(
                children: <Widget>[
                  ListTile(
                    title: Text(
                      move['name'],
                      style: TextStyle(),
                    ),
                    onTap: () {
                      print(move['url']);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    child: Divider(),
                  ),
                ],
              );
            },
          );
  }
}
