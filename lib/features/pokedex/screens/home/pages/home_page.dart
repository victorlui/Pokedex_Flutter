import 'package:flutter/material.dart';

import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/features/pokedex/screens/details/container/detail_container.dart';
import 'package:pokedex/features/pokedex/screens/home/pages/widgets/pokemon_item_widgets.dart';

class HomePage extends StatelessWidget {
  final List<Pokemon> list;
  final Function(String, DetailArgumnets) onItemTap;
  const HomePage({
    Key? key,
    required this.list,
    required this.onItemTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: const Text(
          'Pokedex',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu, color: Colors.black),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            children: list
                .map((e) => PokemonItemWidget(
                      pokemon: e,
                      onTap: onItemTap,
                      index: list.indexOf(e),
                    ))
                .toList()),
      ),
    );
  }
}
