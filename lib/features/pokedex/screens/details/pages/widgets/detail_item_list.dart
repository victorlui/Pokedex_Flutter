import 'package:flutter/material.dart';

import 'package:pokedex/common/models/pokemon.dart';

class DetailItemList extends StatelessWidget {
  final bool diff;
  final Pokemon pokemon;
  const DetailItemList({
    Key? key,
    required this.diff,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 400),
        opacity: diff ? 0.4 : 1.0,
        child: TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn,
            tween:
                Tween<double>(end: diff ? 100 : 300, begin: diff ? 300 : 100),
            builder: (context, value, child) {
              return Image.network(
                pokemon.image,
                width: value,
                fit: BoxFit.contain,
                color: diff ? Colors.black.withOpacity(0.4) : null,
              );
            }),
      ),
    );
  }
}
