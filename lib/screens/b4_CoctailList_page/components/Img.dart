import 'package:flutter/material.dart';

import '../../../Model/coctails_model.dart';

class Img extends StatelessWidget {
  const Img({
    super.key,
    required this.size,
    required this.model,
  });

  final Size size;
  final WinesModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Center(
        child: Hero(
          tag: model.idDrink ?? '',
          child: SizedBox(
              height: size.height * 0.30,
              child: Image.network(model.strDrinkThumb ?? '')),
        ),
      ),
    );
  }
}
