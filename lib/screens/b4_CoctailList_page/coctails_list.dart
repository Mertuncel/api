import 'package:api/Model/coctails_model.dart';
import 'package:api/screens/b4_CoctailList_page/details_page.dart';
import 'package:flutter/material.dart';

class CoctailList extends StatelessWidget {
  final WinesModel model;
  const CoctailList({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CoctailsDetail(model: model),
              ));
            },
            child: Hero(
              tag: model.idDrink ?? '',
              child: SizedBox(
                height: size.height * 0.15,
                child: Image.network(model.strDrinkThumb ?? ''),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            model.strDrink ?? '',
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
