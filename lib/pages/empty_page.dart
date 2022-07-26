import 'dart:async';

import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';
import 'package:go_router/go_router.dart';

class EmptyPage extends StatefulWidget {
  const EmptyPage({super.key});

  @override
  State<EmptyPage> createState() => _EmptyPageState();
}

class _EmptyPageState extends State<EmptyPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 6), () {
      context.go('/login');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Stack(
          children: [
            Positioned(
              child: Shimmer.fromColors(
                loop: 1,
                baseColor: Colors.white,
                highlightColor: Colors.blue,
                child: Image.asset(
                  'assets/images/Vector 34.png',
                ),
              ),
            ),
            Positioned(
              child: Shimmer.fromColors(
                loop: 3,
                baseColor: Colors.blue,
                highlightColor: Colors.white,
                child: Image.asset(
                  'assets/images/Subtract.png',
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const SizedBox(
          height: 18,
          width: 107,
          child: Text(
            'Movie Wtc',
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic),
          ),
        )
      ])),
    );
  }
}
