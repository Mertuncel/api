import 'package:flutter/material.dart';

class LoginImg extends StatelessWidget {
  const LoginImg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
        child: Padding(
      padding: EdgeInsets.only(
        top: size.height * 0.08,
      ),
      child: Image.asset('assets/images/login.png', height: size.height * 0.22),
    ));
  }
}
