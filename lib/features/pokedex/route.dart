import 'package:flutter/material.dart';
import 'package:pokedex/common/repositories/pokemon_repository.dart';
import 'package:pokedex/features/pokedex/screens/details/container/detail_container.dart';
import 'package:pokedex/features/pokedex/screens/home/container/home_container.dart';

class PokedexRoute extends StatelessWidget {
  final PokemonRepository repository;
  const PokedexRoute({
    Key? key,
    required this.repository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) {
            return HomeContainer(
              repository: repository,
              onItemTap: (route, arguments) {
                Navigator.of(context).pushNamed(route, arguments: arguments);
              },
            );
          });
        }

        if (settings.name == '/details') {
          return MaterialPageRoute(builder: (context) {
            return DetailContainer(
              repository: repository,
              argumnets: (settings.arguments as DetailArgumnets),
              onBack: () => Navigator.of(context).pop(),
            );
          });
        }
      },
    );
  }
}
