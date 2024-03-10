import 'package:api/screens/b4_CoctailList_page/coctails_list.dart';
import 'package:flutter/material.dart';

import 'package:api/Model/coctails_model.dart';

import 'package:api/service/coctail_api_service.dart';

class CoctailsHome extends StatefulWidget {
  const CoctailsHome({
    Key? key,
  }) : super(key: key);

  @override
  State<CoctailsHome> createState() => _CoctailsHomeState();
}

class _CoctailsHomeState extends State<CoctailsHome> {
  late Future<List<WinesModel>> _coctails;

  @override
  void initState() {
    super.initState();
    _coctails = CoctailApi.fetchWines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Coctail List'),
        ),
        body: FutureBuilder(
          future: _coctails,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<WinesModel>? coctailList = snapshot.data;
              return GridView.builder(
                  itemCount: coctailList?.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return CoctailList(model: coctailList![index]);
                  });
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Hata'),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
