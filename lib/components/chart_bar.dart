import 'package:flutter/material.dart';
import 'package:pokemon_app/utilities/constants.dart';

class ChartBar extends StatelessWidget {
  final baseStats;

  const ChartBar({Key key, this.baseStats}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            height: 10.0,
            width: screen.width - 100.0,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
          Container(
            height: 10.0,
            width: (screen.width - 100.0) * (this.baseStats / 255),
            decoration: BoxDecoration(
              color: kBlue,
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
        ],
      ),
    );
  }
}
