import 'package:flutter/material.dart';

List<Widget> tabScroll() => [
      Tab(
        child: Container(
          alignment: Alignment.center,
          constraints: BoxConstraints.expand(width: 100),
          child: Text("Home"),
        ),
      ),
      Tab(
        child: Container(
          alignment: Alignment.center,
          constraints: BoxConstraints.expand(width: 100),
          child: Text("Articles"),
        ),
      ),
      Tab(
        child: Container(
          alignment: Alignment.center,
          constraints: BoxConstraints.expand(width: 100),
          child: Text("User"),
        ),
      ),
      Tab(
        child: Container(
          alignment: Alignment.center,
          constraints: BoxConstraints.expand(width: 100),
          child: Text("Add"),
        ),
      ),
      Tab(
        child: Container(
          alignment: Alignment.center,
          constraints: BoxConstraints.expand(width: 100),
          child: Text("Post"),
        ),
      ),
      Tab(
        child: Container(
          alignment: Alignment.center,
          constraints: BoxConstraints.expand(width: 100),
          child: Text("Comments"),
        ),
      ),
    ];
