import 'package:flutter/material.dart';

import 'package:pokedex/common/models/pokemon.dart';

class DetailAppBarWidget extends StatelessWidget {
  final Pokemon pokemon;
  final VoidCallback onBack;
  final bool isOntop;
  const DetailAppBarWidget({
    Key? key,
    required this.pokemon,
    required this.onBack,
    required this.isOntop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      elevation: 0,
      backgroundColor: pokemon.baseColor,
      leading: IconButton(
        onPressed: onBack,
        icon: const Icon(Icons.keyboard_arrow_left_outlined),
      ),
      centerTitle: false,
      title: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: isOntop ? 0 : 1,
        child: Text(
          pokemon.name,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
