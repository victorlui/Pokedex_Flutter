import 'package:flutter/material.dart';

import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/features/pokedex/screens/details/pages/widgets/detail_app_bar_widget.dart';
import 'package:pokedex/features/pokedex/screens/details/pages/widgets/detail_list_widget.dart';

class DetailPage extends StatefulWidget {
  final Pokemon pokemon;
  final List<Pokemon> list;
  final VoidCallback onBack;
  final PageController controller;
  final ValueChanged<Pokemon> onChangePokemon;

  const DetailPage({
    Key? key,
    required this.pokemon,
    required this.list,
    required this.onBack,
    required this.controller,
    required this.onChangePokemon,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late ScrollController scroolController;
  bool isOnTop = false;

  @override
  void initState() {
    scroolController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener(
        onNotification: (notification) {
          setState(() {
            if (scroolController.position.pixels > 17) {
              isOnTop = false;
            } else if (scroolController.position.pixels <= 16) {
              isOnTop = true;
            }
          });

          return false;
        },
        child: CustomScrollView(
          controller: scroolController,
          physics: const ClampingScrollPhysics(),
          slivers: [
            DetailAppBarWidget(
              pokemon: widget.pokemon,
              onBack: widget.onBack,
              isOntop: isOnTop,
            ),
            DetailListWidget(
              pokemon: widget.pokemon,
              list: widget.list,
              controller: widget.controller,
              onChangePokemon: widget.onChangePokemon,
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Container(
                      color: widget.pokemon.baseColor,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(
                            (24),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
