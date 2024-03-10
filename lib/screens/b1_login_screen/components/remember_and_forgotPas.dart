import 'package:flutter/material.dart';

class RememberMeAndForgotPass extends StatefulWidget {
  const RememberMeAndForgotPass({
    super.key,
    required this.value,
    required this.press,
  });

  final bool value;
  final Function(bool?) press;

  @override
  State<RememberMeAndForgotPass> createState() =>
      _RememberMeAndForgotPassState();
}

class _RememberMeAndForgotPassState extends State<RememberMeAndForgotPass> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
          left: size.height * 0.07,
          top: size.height * 0.01,
          right: size.height * 0.03),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Checkbox(
                  checkColor: Colors.blue,
                  side: const BorderSide(color: Colors.blue),
                  fillColor:
                      const MaterialStatePropertyAll<Color>(Colors.white),
                  value: widget.value,
                  onChanged: widget.press),
              const Text('Remember Me'),
            ],
          ),
          InkWell(
            onTap: () {},
            child: const Text(
              'Forgot Password',
              style: TextStyle(
                  fontSize: 14.5,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 58, 155, 235)),
            ),
          )
        ],
      ),
    );
  }
}
