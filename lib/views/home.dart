import 'package:flutter/material.dart';
import 'package:pokemon_app/components/custom_navigation_bar.dart';
import 'package:pokemon_app/components/gradient_background.dart';
import 'package:pokemon_app/utilities/constants.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    this._tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    this._tabController.dispose();
    super.dispose();
  }

  AppBar appBar({Size screenSize}) {
    return AppBar(
      title: Text(
        'Pokemons',
        style: TextStyle(
          color: kBlack,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: Container(
          margin: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 15.0),
          decoration: BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.12),
            borderRadius: BorderRadius.circular(18.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 36.0,
                width: screenSize.width - 32.0,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  style: TextStyle(
                    fontSize: 17.0,
                    color: kDarkGrey,
                    height: 1.0,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search',
                    icon: Icon(
                      Icons.search,
                      color: kDarkGrey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      flexibleSpace: GradientBackground(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: this.appBar(screenSize: screen),
      body: TabBarView(
        controller: this._tabController,
        children: <Widget>[
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.grey,
          ),
          Container(
            color: Colors.yellow,
          ),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
        tabController: this._tabController,
      ),
    );
  }
}
