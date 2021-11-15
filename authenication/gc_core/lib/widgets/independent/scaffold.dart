//Scaffold for G1 Mobile Application
//Author: baocq@galaxy.one
//Date: 2021-05-26

import 'package:flutter/material.dart';

class G1MobileScaffold extends StatelessWidget {
  final Color? background;
  final String title;
  final Widget body;

  const G1MobileScaffold(
      {key, this.background, required this.title, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      backgroundColor: background,
      body: SafeArea(
        child: body,
      ),
    );
  }
}
