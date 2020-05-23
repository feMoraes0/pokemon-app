import 'package:flutter/material.dart';
import 'package:pokemon_app/components/gradient_background.dart';
import 'package:pokemon_app/utilities/constants.dart';

class CustomNavigationBar extends StatelessWidget {
  final TabController tabController;

  const CustomNavigationBar({
    Key key,
    @required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double paddingBottom = MediaQuery.of(context).padding.bottom;
    return GradientBackground(
      height: 72.0 + paddingBottom,
      child: BottomAppBar(
        color: Colors.transparent,
        elevation: 0.0,
        child: TabBar(
          controller: this.tabController,
          indicatorColor: Colors.transparent,
          labelColor: kBlack,
          labelStyle: TextStyle(color: kBlack),
          unselectedLabelColor: kLightGreyTab,
          unselectedLabelStyle: TextStyle(color: kLightGreyTab),
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.category),
              text: 'Pokemons',
            ),
            Tab(
              icon: Icon(Icons.category),
              text: 'Moves',
            ),
            Tab(
              icon: Icon(Icons.category),
              text: 'Itens',
            ),
          ],
        ),
      ),
    );
  }
}
