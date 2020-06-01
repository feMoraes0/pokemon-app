import 'package:flutter/material.dart';
import 'package:pokemon_app/utilities/constants.dart' as Constants;

class PokemonDetails extends StatefulWidget {
  static const String routeName = '/pokemon/details';

  final String url;

  const PokemonDetails({
    Key key,
    this.url,
  }) : super(key: key);

  @override
  _PokemonDetailsState createState() => _PokemonDetailsState();
}

class _PokemonDetailsState extends State<PokemonDetails> {
  ScrollController _scrollController;
  String _url;

  @override
  void initState() {
    this._scrollController = ScrollController();
    this._url = widget.url;
    super.initState();
  }

  @override
  void dispose() {
    this._scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    double paddingTop = MediaQuery.of(context).padding.top;
    double appbar = AppBar().preferredSize.height;
    double bodyHeight = screen.height - appbar - paddingTop;
    return Scaffold(
      backgroundColor: Constants.kLightBlue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          controller: this._scrollController,
          child: Stack(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 90.0),
                height: bodyHeight,
                padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(48.0),
                    topRight: Radius.circular(48.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'Squirtle',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.normal,
                        color: Constants.kDarkGrey,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/tag-types/Water@3x.png',
                          height: 40.0,
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),

                    /// STATS

                    Text(
                      'Abilities',
                      textAlign: TextAlign.start,
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
              Positioned(
                top: 0,
                left: screen.width * 0.10,
                child: Container(
                  width: screen.width * 0.8,
                  height: 120.0,
                  child: Image.network(
                    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
