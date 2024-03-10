import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/RegisterText.dart';
import 'components/button.dart';
import 'components/login_Img.dart';
import 'components/remember_and_forgotPas.dart';
import 'components/text_field_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  bool _rememberMe = false;

  bool _loading = false;
  void isLoading() {
    setState(() {
      _loading = !_loading;
    });
  }

  @override
  void initState() {
    super.initState();
    accesConroller();
  }

  accesConroller() async {
    final pref = await SharedPreferences.getInstance();
    bool? isLogin = pref.getBool('isLogin');

    if (isLogin == null) {
      //giris yapılmamış
    } else if (isLogin) {
      // ignore: use_build_context_synchronously
      GoRouter.of(context).replace('/home');
    }
    {}
  }

  Future<void> login() async {
    isLoading();
    final dio = Dio();
    String url = 'https://reqres.in/api/login';
    try {
      var response = await dio.post(url, data: {
        'email': _emailController.text,
        'password': _passwordController.text,
      });

      if (response.statusCode == 200) {
        var data = response.data;
        var token = data['token'];
        //hafızaya yazma
        final pref = await SharedPreferences.getInstance();
        await storage.write(key: 'token', value: token);
        await pref.setBool('isLogin', true);

        // ignore: use_build_context_synchronously
        GoRouter.of(context).replace('/home');
      } else {}
    } catch (e) {
    } finally {
      isLoading();
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isObscure = true;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 245, 246, 248),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: _loading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    const Text(
                        'E-mail : eve.holt@reqres.in \nPassword : cityslicka'),
                    const LoginImg(),
                    const SizedBox(height: 30),
                    TextFieldBar(
                      text: 'E-mail',
                      controller: _emailController,
                      icon: Icons.person,
                    ),
                    TextFieldBar(
                      text: 'Password',
                      controller: _passwordController,
                      isObscure: isObscure,
                      icon: Icons.lock_open_sharp,
                    ),
                    RememberMeAndForgotPass(
                      press: (value) {
                        setState(() {
                          _rememberMe = value!;
                        });
                      },
                      value: _rememberMe,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Button(press: () {
                      login();
                    }),
                    const RegisterText(),
                  ],
                ),
              ),
      ),
    );
  }
}
