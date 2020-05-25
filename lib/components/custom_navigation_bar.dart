import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    int currentTab = this.tabController.index;
    return GradientBackground(
      height: 72.0 + paddingBottom,
      marginTop: true,
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
              icon: SvgPicture.asset(
                'icons/pokemon-icon.svg',
                color: (currentTab == 0) ? kBlack : kBlackOpacity,
              ),
              text: 'Pokemons',
            ),
            Tab(
              icon: SvgPicture.asset(
                'icons/moves-icon.svg',
                color: (currentTab == 1) ? kBlack : kBlackOpacity,
              ),
              text: 'Moves',
            ),
            Tab(
              icon: SvgPicture.asset(
                'icons/itens-icon.svg',
                color: (currentTab == 2) ? kBlack : kBlackOpacity,
              ),
              text: 'Items',
            ),
          ],
        ),
      ),
    );
  }
}
