import 'dart:ui';

import 'package:flutter/material.dart';

Widget textFormField(
    {IconData? icon,
    String? hintText,
    IconButton? iconButton,
    bool? isPassword,
    bool? isEmail,
    TextEditingController? controller,
    FormFieldValidator? validator,
    required BuildContext context}) {
  Size size = MediaQuery.of(context).size;
  return ClipRRect(
    borderRadius: BorderRadius.circular(15),
    child: BackdropFilter(
      filter: ImageFilter.blur(
        sigmaY: 15,
        sigmaX: 15,
      ),
      child: Container(
        height: size.width / 7,
        width: size.width / 1.2,
        alignment: Alignment.center,
        padding: EdgeInsets.only(right: size.width / 30),
        decoration: BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextFormField(
          validator: validator,
          controller: controller,
          style: const TextStyle(color: Colors.black),
          cursorColor: Colors.black,
          obscureText: isPassword!,
          keyboardType:
              isEmail! ? TextInputType.emailAddress : TextInputType.text,
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: Colors.black,
            ),
            suffixIcon: iconButton,
            border: InputBorder.none,
            hintMaxLines: 1,
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 14, color: Colors.black),
          ),
        ),
      ),
    ),
  );
}
