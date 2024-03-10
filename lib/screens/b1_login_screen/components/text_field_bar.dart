import 'package:flutter/material.dart';

class TextFieldBar extends StatefulWidget {
  const TextFieldBar({
    super.key,
    required this.text,
    required this.controller,
    this.isObscure,
    required this.icon,  
  });

  final String text;
  final TextEditingController controller;
  final bool? isObscure;
  final IconData? icon;
  


  @override
  State<TextFieldBar> createState() => _TextFieldBarState();
}

class _TextFieldBarState extends State<TextFieldBar> {
  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
          left: size.width * 0.05,
          right: size.width * 0.05,
          top: size.width * 0.03),
      child: TextField(
        obscureText: widget.isObscure ?? false,
        controller: widget.controller,
        decoration: InputDecoration(
            icon: CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 58, 155, 235),
                child: Icon(
                  widget.icon,
                  color: const Color.fromARGB(255, 248, 247, 247),
                )),
            labelText: widget.text,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(style: BorderStyle.none))),
      ),
    );
  }
}
