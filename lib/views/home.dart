import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemons'),
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
                  width: screen.width - 32.0,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    style: TextStyle(
                      fontSize: 17.0,
                      color: Color(0xFF4F4F4F),
                      height: 1.0,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search',
                      icon: Icon(
                        Icons.search,
                        color: Color(0xFF4F4F4F),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: this._tabController,
        children: <Widget>[
          Container(),
          Container(),
          Container(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: TabBar(
          controller: this._tabController,
          indicatorColor: Colors.transparent,
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
