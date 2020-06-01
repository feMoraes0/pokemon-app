import 'package:flutter/material.dart';
import 'package:pokemon_app/views/home.dart';
import 'package:pokemon_app/views/pokemon_details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  dynamic generateNamedRoutes(RouteSettings settings) {
    /**
     *  Route Name: /home
     */
    if (settings.name == Home.routeName) {
      return MaterialPageRoute(builder: (context) {
        return Home();
      });
    }

    /**
     *  Route Name: /pokemons/details
     */
    if (settings.name == PokemonDetails.routeName) {
      final Map args = settings.arguments;
      return MaterialPageRoute(builder: (context) {
        return PokemonDetails(
          id: args['id'],
          name: args['name'],
        );
      });
    }

    return null;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Avenir',
      ),
      onGenerateRoute: (settings) => this.generateNamedRoutes(settings),
      initialRoute: '/home',
    );
  }
}
