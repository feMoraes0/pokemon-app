import 'package:flutter/material.dart';
import 'package:pokemon_app/components/loading.dart';
import 'package:pokemon_app/services/network_helper.dart';
import 'package:pokemon_app/utilities/string_extension.dart';

const kTotalItems = 954;

class Items extends StatefulWidget {
  @override
  _ItemsState createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  List _items;

  @override
  void initState() {
    super.initState();
    this._items = [];
    this.getItemsData();
  }

  void getItemsData() async {
    NetWorkHelper network = NetWorkHelper(
      url: 'https://pokeapi.co/api/v2/item?offset=0&limit=$kTotalItems',
    );
    dynamic data = await network.getData();

    if (mounted) {
      setState(() {
        this._items = data['results'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return (this._items.length == 0)
        ? Loading()
        : ListView.builder(
            itemCount: this._items.length,
            itemBuilder: (context, index) {
              Map item = this._items[index];
              return Column(
                children: <Widget>[
                  ListTile(
                    leading: Image.network(
                      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/items/${item['name']}.png',
                    ),
                    title: Text(
                      '${item['name']}'.camelCase(),
                      style: TextStyle(),
                    ),
                    onTap: () {
                      print(item['url']);
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
