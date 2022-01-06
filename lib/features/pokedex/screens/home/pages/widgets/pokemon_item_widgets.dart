import 'package:flutter/material.dart';

import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/features/pokedex/screens/details/container/detail_container.dart';
import 'package:pokedex/features/pokedex/screens/home/pages/widgets/type_widgets.dart';

class PokemonItemWidget extends StatelessWidget {
  final Pokemon pokemon;
  final Function(String, DetailArgumnets) onTap;
  final int index;
  const PokemonItemWidget({
    Key? key,
    required this.pokemon,
    required this.onTap,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          onTap('/details', DetailArgumnets(pokemon: pokemon, index: index)),
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
              color: pokemon.baseColor?.withOpacity(0.8),
              borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  pokemon.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                          pokemon.type.map((e) => TypeWidget(name: e)).toList(),
                    ),
                    Flexible(
                      child: Container(
                        color: Colors.transparent,
                        height: 100,
                        width: 100,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 12,
          right: 2,
          child: Image.network(
            pokemon.image,
            height: 100,
          ),
        ),
      ]),
    );
  }
}
