import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaleRatio = MediaQuery.of(context).size.height / 812.0;
    return Positioned(
      top: 30.0,
      left: 20.0,
      right: 0.0,
      height: 84.0 * scaleRatio,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 30,
            width: 68,
            child: Image.asset('assets/icons/icon_app_big.png'),
          ),
          const SizedBox(width: 195),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                icon: Image.asset('assets/icons/search_icon.png'),
                color: Colors.white,
                splashRadius: 20,
                splashColor: Colors.white,
                //iconSize: 24,
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset('assets/icons/profile_icon.png'),
                //iconSize: 50,
                splashRadius: 20,
                splashColor: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
