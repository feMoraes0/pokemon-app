import 'package:flutter/material.dart';
import 'package:pokemon_app/utilities/constants.dart' as Constants;

class PokemonDetails extends StatefulWidget {
  final String url;

  const PokemonDetails({
    Key key,
    this.url,
  }) : super(key: key);

  @override
  _PokemonDetailsState createState() => _PokemonDetailsState();
}

class _PokemonDetailsState extends State<PokemonDetails> {
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    double paddingTop = MediaQuery.of(context).padding.top;
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          floating: true,
          excludeHeaderSemantics: false,
          backgroundColor: Constants.kLightBlue,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            'Hello',
            style: TextStyle(
              fontSize: 24.0,
            ),
          ),
          expandedHeight: 240.0 + paddingTop,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              height: 240.0 + paddingTop,
              width: screen.width,
              child: Image.network(
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              height: 300.0,
              color: Colors.red,
            ),
            Container(
              height: 300.0,
              color: Colors.red,
            ),
            Container(
              height: 300.0,
              color: Colors.red,
            ),
          ]),
        ),
      ],
    );
  }
}
