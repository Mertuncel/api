import 'package:flutter/material.dart';

class RegisterText extends StatelessWidget {
  const RegisterText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Don't have an account?"),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {},
            child: const Text(
              "Register!",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 58, 155, 235)),
            ),
          )
        ],
      ),
    );
  }
}
