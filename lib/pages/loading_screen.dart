import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(child: Text("Gradijent proba")),
        decoration: BoxDecoration(
        gradient: LinearGradient(
        begin:Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0X00000000),
          Color(0XFFFFFFFF),
        ],
        ),
      ),
    ));
  }
}

