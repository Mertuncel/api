import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key, required this.press,
  });

  final Function() press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(left: size.width * 0.13),
      child: SizedBox(
        width: size.width / 1.4,
        height: 45,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 58, 155, 235)),
            onPressed: press,
            child: const Text(
              'Giriş Yap',
              style: TextStyle(color: Colors.white),
            )),
      ),
    );
  }
}
