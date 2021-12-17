import 'package:flutter/material.dart';

AppBar customAppBar() {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // GitHub Icon
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(
            // TODO; fix here
            'assets/images/GitHub-Mark-Light-120px-plus.png',
            width: 30,
            height: 30,
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(width: 20),
        // Title
        const Text('GitHub Summary'),
      ],
    ),
  );
}
