import 'package:flutter/material.dart';
import 'package:suq_app/components/my_button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_bag_rounded,
              size: 120,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(height: 10),
            Text(
              'Suq'.toUpperCase(),
              style: const TextStyle(
                fontSize: 28,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'All premium quality goods',
              style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),

            const SizedBox(height: 32),
            // BUTTON
            MyButton(
              onTap: () {
                Navigator.pushNamed(context, '/shop-page');
              },
              child: const Icon(
                Icons.arrow_forward,
                size: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
