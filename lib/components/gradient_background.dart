import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;
  final height;
  final bool marginBottom, marginTop;

  const GradientBackground({
    Key key,
    this.marginBottom,
    this.height,
    this.marginTop,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF6E95FD),
                  Color(0xFF6FDEFA),
                  Color(0xFF8DE061),
                  Color(0xFF51E85E),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: (this.marginBottom ?? false) ? 5.0 : 0.0,
              top: (this.marginTop ?? false) ? 5.0 : 0.0,
            ),
            color: Color.fromRGBO(250, 250, 250, 0.6),
          ),
          this.child ?? Container(),
        ],
      ),
    );
  }
}
