import 'package:flutter/material.dart';
import 'package:pokemon_app/components/loading.dart';
import 'package:pokemon_app/views/pokemon_details.dart';
import 'package:pokemon_app/services/network_helper.dart';
import 'package:pokemon_app/utilities/string_extension.dart';
import 'package:pokemon_app/utilities/int_extension.dart';
import 'package:pokemon_app/utilities/constants.dart' as Constants;

const kTotalPokemons = 964;

class Pokemons extends StatefulWidget {
  @override
  _PokemonsState createState() => _PokemonsState();
}

class _PokemonsState extends State<Pokemons> {
  List _pokemons;

  @override
  void initState() {
    super.initState();
    this._pokemons = [];

    this.getPokemonData();
  }

  void getPokemonData() async {
    NetWorkHelper network = NetWorkHelper(
      url: 'https://pokeapi.co/api/v2/pokemon?offset=0&limit=$kTotalPokemons',
    );
    dynamic data = await network.getData();

    if (mounted) {
      setState(() {
        this._pokemons = data['results'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return (this._pokemons.length == 0)
        ? Loading()
        : ListView.builder(
            itemCount: this._pokemons.length,
            itemBuilder: (context, index) {
              Map pokemon = this._pokemons[index];
              return Column(
                children: <Widget>[
                  ListTile(
                    leading: Hero(
                      tag: 'imageHero${index + 1}',
                      child: Image.network(
                        '${Constants.kPokemonImageURL}${index + 1}.png',
                      ),
                    ),
                    title: Text(
                      '${pokemon['name']}'.camelCase(),
                      style: Constants.kTitleCardStyle,
                    ),
                    subtitle: Text(
                      '#${(index + 1).toStringWithDigits(3)}',
                      style: Constants.kSubtitleCardStyle,
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        PokemonDetails.routeName,
                        arguments: {
                          'id': index + 1,
                          'name': pokemon['name'],
                        },
                      );
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
