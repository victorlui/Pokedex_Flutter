import 'package:flutter/material.dart';

class PoError extends StatelessWidget {
  final String? error;
  const PoError({
    Key? key,
    this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(error ?? 'Erro durante a operação'),
      ),
    );
  }
}
