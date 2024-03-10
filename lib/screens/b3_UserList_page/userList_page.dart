import 'package:api/Model/items_model.dart';
import 'package:api/service/api_service.dart';
import 'package:flutter/material.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  late Future<List<ItemsModel>> _itemList;

  @override
  void initState() {
    super.initState();
    _itemList = ApiService.fetchItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('User List'),
        ),
        body: FutureBuilder(
          future: _itemList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ItemsModel>? list = snapshot.data;
              return ListView.builder(
                itemCount: list?.length,
                itemBuilder: (context, index) => Card(
                  elevation: 4,
                  child: ListTile(
                      leading: Image.network(list?[index].avatar ?? ''),
                      subtitle: Text(list?[index].email ?? ''),
                      title: Row(
                        children: [
                          Text(list?[index].firstName ?? ''),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(list?[index].lastName ?? '')
                        ],
                      )),
                ),
              );
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
