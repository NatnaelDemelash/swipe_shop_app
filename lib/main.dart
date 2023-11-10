import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suq_app/models/shop.dart';
import 'package:suq_app/pages/cart_page.dart';
import 'package:suq_app/themes/light_mode.dart';

import 'pages/intro_page.dart';
import 'pages/settings_page.dart';
import 'pages/shop_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Shop(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      theme: lightMode,
      routes: {
        '/intro-page': (context) => const IntroPage(),
        '/shop-page': (context) => const ShopPage(),
        '/cart-page': (context) => const CartPage(),
        '/settings-page': (context) => const SettingsPage(),
      },
    );
  }
}
