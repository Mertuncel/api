import 'package:api/screens/b5_weather_page/weather_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:api/screens/b3_UserList_page/userList_page.dart';
import 'package:api/screens/b4_CoctailList_page/CoctailsHome_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final storage = const FlutterSecureStorage();

  Future<void> logout(BuildContext context) async {
    final pref = await SharedPreferences.getInstance();
    await storage.deleteAll();
    await pref.clear();

    // ignore: use_build_context_synchronously
    GoRouter.of(context).pushReplacement('/');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('CATEGORİES'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    title: const Text('Log Out'),
                    content: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Are You Sure Would Like To Log Out?',
                      ),
                    ),
                    actions: [
                      CupertinoDialogAction(
                        child: const Text('Yes'),
                        onPressed: () {
                          logout(context);
                        },
                      ),
                      CupertinoDialogAction(
                        isDestructiveAction: true,
                        child: const Text('No'),
                        onPressed: () {
                          GoRouter.of(context).pop();
                        },
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.power_settings_new_outlined)),
        ],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                apiCategories(
                    size: size,
                    press: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const UserListPage(),
                        )),
                    title: 'User List',
                    color: const Color.fromARGB(255, 75, 160, 229),
                    icon: Icons.person),
                apiCategories(
                    size: size,
                    press: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const CoctailsHome(),
                        )),
                    title: 'Coctail List',
                    color: const Color.fromARGB(255, 212, 34, 21),
                    icon: Icons.wine_bar_outlined),
                apiCategories(
                    size: size,
                    press: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const WeatherPage(),
                        )),
                    title: 'Weather',
                    color: const Color.fromARGB(255, 123, 130, 14),
                    icon: Icons.cloud),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget apiCategories(
    {required Size size,
    required Function() press,
    required String title,
    required Color color,
    required IconData icon}) {
  return InkWell(
    onTap: press,
    child: Padding(
      padding: const EdgeInsets.only(left: 40, top: 15, bottom: 10),
      child: Container(
        height: size.height * 0.2,
        width: size.width * 0.75,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(20)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12),
          ),
          const SizedBox(
            height: 15,
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            minRadius: 15,
            child: Icon(icon),
          )
        ]),
      ),
    ),
  );
}
