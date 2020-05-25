import 'package:flutter/material.dart';
import 'package:pokemon_app/components/loading.dart';
import 'package:pokemon_app/services/network_helper.dart';

class Pokemons extends StatefulWidget {
  @override
  _PokemonsState createState() => _PokemonsState();
}

class _PokemonsState extends State<Pokemons> {
  List _pokemons;
  int _totalPokemons;

  @override
  void initState() {
    this._pokemons = [];
    this._totalPokemons = 1;
    this.getPokemonData();
    super.initState();
  }

  void getPokemonData() async {
    NetWorkHelper network = NetWorkHelper(
      url: 'https://pokeapi.co/api/v2/pokemon?offset=0&limit=964',
    );
    dynamic data = await network.getData();

    setState(() {
      this._pokemons.addAll(data['results']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return (this._pokemons.length == 0)
        ? Loading()
        : ListView.builder(
            itemCount: this._pokemons.length,
            itemBuilder: (context, index) {
              Map pokemon = this._pokemons[index];
              return ListTile(
                leading: Image.network(
                  'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index + 1}.png',
                ),
                title: Text(
                  pokemon['name'],
                  style: TextStyle(),
                ),
                subtitle: Text(
                  '#${index + 1}',
                ),
                onTap: () {
                  print(pokemon['url']);
                },
              );
            },
          );
  }
}
