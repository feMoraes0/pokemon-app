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
    return Scaffold(
      backgroundColor: Constants.kLightBlue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: 214.0,
            child: Image.network(
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png',
              fit: BoxFit.fitHeight,
            ),
          ),
          Container(
            height: 300.0,
            padding: const EdgeInsets.fromLTRB(
              20.0,
              40.0,
              20.0,
              0.0,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(48.0),
                topRight: Radius.circular(48.0),
              ),
            ),
            child: Column(
              children: <Widget>[
                Text(
                  'Squirtle',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.normal,
                    color: Constants.kDarkGrey,
                  ),
                ),
                SizedBox(height: 10.0),
                Image.asset(
                  'assets/tag-types/Water@3x.png',
                  width: screen.width * 0.32,
                ),
                SizedBox(height: 10.0),

                /// STATS

                Text(
                  'Abilities',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF559EDF),
                  ),
                ),

                /// Sprites

                ///
              ],
            ),
          ),
        ],
      ),
    );
  }
}
