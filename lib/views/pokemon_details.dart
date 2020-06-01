import 'package:flutter/material.dart';
import 'package:pokemon_app/components/loading.dart';
import 'package:pokemon_app/services/network_helper.dart';
import 'package:pokemon_app/utilities/string_extension.dart';
import 'package:pokemon_app/utilities/constants.dart' as Constants;

class PokemonDetails extends StatefulWidget {
  static const String routeName = '/pokemon/details';

  final int id;
  final String name;

  const PokemonDetails({
    Key key,
    this.id,
    this.name,
  }) : super(key: key);

  @override
  _PokemonDetailsState createState() => _PokemonDetailsState();
}

class _PokemonDetailsState extends State<PokemonDetails> {
  ScrollController _scrollController;
  int _id;
  String _name;

  @override
  void initState() {
    this._scrollController = ScrollController();
    this._id = widget.id;
    this._name = widget.name;
    super.initState();
  }

  Future<Map> getData() async {
    NetWorkHelper netWorkHelper = NetWorkHelper(
      url: '${Constants.kPokemonImageURL}${this._id}.png',
    );
    dynamic response = await netWorkHelper.getData();
    return response;
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
              FutureBuilder(
                future: this.getData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Loading();
                  }
                  print(snapshot.data);
                  return Container(
                    margin: const EdgeInsets.only(top: 135.0),
                    height: bodyHeight,
                    padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          '${this._name}'.camelCase(),
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
                          style: Constants.kDetailsSectionTextStyle,
                        ),

                        Text(
                          'Sprites',
                          textAlign: TextAlign.start,
                          style: Constants.kDetailsSectionTextStyle,
                        ),
                      ],
                    ),
                  );
                },
              ),
              Positioned(
                top: -20,
                left: screen.width * 0.10,
                child: Hero(
                  tag: 'imageHero${this._id}',
                  child: Container(
                    width: screen.width * 0.8,
                    height: 220.0,
                    child: Image.network(
                      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${this._id}.png',
                      fit: BoxFit.fitHeight,
                    ),
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
