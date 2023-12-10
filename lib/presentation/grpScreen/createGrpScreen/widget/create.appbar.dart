import 'package:flutter/material.dart';

AppBar createGrpBar({required BuildContext context}) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title: const Text(
      'Create new group',
      style: TextStyle(
        fontSize: 26,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
    automaticallyImplyLeading: false,
    leading: IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: const Icon(
        Icons.arrow_back_ios,
        size: 20,
        color: Colors.black,
      ),
    ),
  );
}
