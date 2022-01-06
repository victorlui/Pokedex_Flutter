import 'package:flutter/material.dart';

class PoLoading extends StatelessWidget {
  const PoLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
