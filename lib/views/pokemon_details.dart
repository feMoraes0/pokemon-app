import 'package:flutter/material.dart';
import 'package:pokemon_app/components/chart_bar.dart';
import 'package:pokemon_app/components/loading.dart';
import 'package:pokemon_app/services/network_helper.dart';
import 'package:pokemon_app/utilities/string_extension.dart';
import 'package:pokemon_app/utilities/int_extension.dart';
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
      url: '${Constants.kUniquePokemonURL}${this._id}',
    );
    dynamic response = await netWorkHelper.getData();
    return response;
  }

  @override
  void dispose() {
    this._scrollController.dispose();
    super.dispose();
  }

  List<Image> buildTypes(List types) {
    List<Image> response = [];

    types.reversed.forEach((type) {
      response.add(
        Image.asset(
          Constants.kTypeImageConverter[type['type']['name']],
          height: 40.0,
        ),
      );
    });

    return response;
  }

  List<Row> buildStats(List stats, Color barColor) {
    List<Row> response = [];

    stats.reversed.forEach((stat) {
      int baseStat = stat['base_stat'];
      response.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              Constants.kStatusNameConverter[stat['stat']['name']]
                  .toUpperCase(),
              style: Constants.kStatusTitleTextStyle.copyWith(
                color: barColor,
              ),
            ),
            SizedBox(width: 5.0),
            Text(
              baseStat.toStringWithDigits(3),
              style: Constants.kStatusNumberTextStyle,
            ),
            SizedBox(width: 5.0),
            ChartBar(
              baseStats: stat['base_stat'],
              barColor: barColor,
            ),
          ],
        ),
      );
    });
    return response;
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    double paddingTop = MediaQuery.of(context).padding.top;
    double appbar = AppBar().preferredSize.height;
    double bodyHeight = screen.height - appbar - paddingTop;
    return FutureBuilder(
      future: this.getData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            color: Colors.grey.shade100,
            height: bodyHeight / 2,
            width: screen.width,
            child: Loading(),
          );
        }

        List abilities = snapshot.data['abilities'];
        Map sprites = snapshot.data['sprites'];
        List stats = snapshot.data['stats'];
        List types = (snapshot.data['types']);
        String mainType = types[types.length - 1]['type']['name'];
        Color mainColor = Constants.kTypeColorConverter[mainType];
        return Scaffold(
          backgroundColor: mainColor,
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
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: bodyHeight,
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(top: 135.0),
                      padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          topRight: Radius.circular(25.0),
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
                            children: this.buildTypes(types),
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            child: Column(
                              children: this.buildStats(stats, mainColor),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Abilities',
                            textAlign: TextAlign.center,
                            style: Constants.kDetailsSectionTextStyle.copyWith(
                              color: mainColor,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          SizedBox(
                            height: 50.0 * (abilities.length / 2).round(),
                            width: screen.width,
                            child: GridView.count(
                              physics: NeverScrollableScrollPhysics(),
                              childAspectRatio:
                                  ((screen.width - 40.0) / 2) / 50.0,
                              crossAxisCount: 2,
                              children: List.generate(
                                abilities.length,
                                (index) {
                                  return Container(
                                    margin: const EdgeInsets.fromLTRB(
                                        10.0, 5.0, 10.0, 5.0),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${abilities[index]['ability']['name']}'
                                            .camelCase(),
                                        style: TextStyle(
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Sprites',
                            textAlign: TextAlign.center,
                            style: Constants.kDetailsSectionTextStyle.copyWith(
                              color: mainColor,
                            ),
                          ),
                          SizedBox(
                            height: 170.0,
                            width: screen.width,
                            child: GridView(
                              physics: NeverScrollableScrollPhysics(),
                              children: <Widget>[
                                Container(
                                  child: Image.network(
                                    sprites['front_default'],
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Container(
                                  child: Image.network(
                                    sprites['front_shiny'],
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ],
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
      },
    );
  }
}
