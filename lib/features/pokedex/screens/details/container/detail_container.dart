import 'package:flutter/material.dart';

import 'package:pokedex/common/failure/failure.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/common/repositories/pokemon_repository.dart';
import 'package:pokedex/common/widgets/po_error.dart';
import 'package:pokedex/common/widgets/po_loading.dart';
import 'package:pokedex/features/pokedex/screens/details/pages/detail_page.dart';

class DetailArgumnets {
  DetailArgumnets({this.index = 0, required this.pokemon});
  final Pokemon pokemon;
  final int index;
}

class DetailContainer extends StatefulWidget {
  final IPokemonRepository repository;
  final DetailArgumnets argumnets;
  final VoidCallback onBack;

  const DetailContainer({
    Key? key,
    required this.repository,
    required this.argumnets,
    required this.onBack,
  }) : super(key: key);

  @override
  State<DetailContainer> createState() => _DetailContainerState();
}

class _DetailContainerState extends State<DetailContainer> {
  late PageController _controller;
  late Future<List<Pokemon>> _future;
  Pokemon? _pokemon;

  @override
  void initState() {
    _controller = PageController(
        viewportFraction: 0.5, initialPage: widget.argumnets.index);
    _future = widget.repository.getAllPokemons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const PoLoading();
        }

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          _pokemon ??= widget.argumnets.pokemon;
          return DetailPage(
            pokemon: _pokemon!,
            list: snapshot.data!,
            onBack: widget.onBack,
            controller: _controller,
            onChangePokemon: (Pokemon value) {
              setState(() {
                _pokemon = value;
              });
            },
          );
        }

        if (snapshot.hasError) {
          return PoError(error: (snapshot.error as Failure).message!);
        }

        return Container();
      },
    );
  }
}
