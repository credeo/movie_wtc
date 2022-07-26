import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Container(
              height: 63,
              width: 156,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/Logo.png'),
                ),
              ),
            ),
            const SizedBox(height: 21),
            Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Center(
                    child: Image.asset('assets/images/Union 5.png'),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  heightFactor: 8.79,
                  child: SizedBox(
                    height: 50,
                    width: 151,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          const Color.fromRGBO(10, 132, 255, 1),
                        ),
                      ),
                      onPressed: () {
                        context.go('/');
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
