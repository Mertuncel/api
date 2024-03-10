import 'package:flutter/material.dart';

import '../../Model/coctails_model.dart';
import 'components/Img.dart';

class CoctailsDetail extends StatelessWidget {
  final WinesModel model;

  const CoctailsDetail({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(model.strDrink ?? ''),
      ),
      body: Column(
        children: [
          Img(size: size, model: model),
          about('ID:', model.idDrink ?? ''),
          about('Category:', model.strCategory ?? ''),
          about('Tags:', model.strTags ?? 'Null'),
          about('Alcoholic:', model.strAlcoholic ?? ''),
          about('Ingredient:',
              '${model.strIngredient1},${model.strIngredient2},${model.strIngredient3},'),
          about('Glass:', model.strGlass ?? ''),
          insAbout('Instructions:', model.strInstructions ?? '')
        ],
      ),
    );
  }
}

Widget about(String text1, String text2) {
  return Padding(
    padding: const EdgeInsets.only(top: 10, left: 10),
    child: Row(
      children: [
        Text(
          text1,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.lightBlue),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          text2,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}

Widget insAbout(String text1, String text2) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, top: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text1,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.lightBlue),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          text2,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
        )
      ],
    ),
  );
}
