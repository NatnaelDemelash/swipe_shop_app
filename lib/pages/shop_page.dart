import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suq_app/components/my_drawer.dart';
import 'package:suq_app/components/my_product_tile.dart';

import '../models/shop.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    // access products in shop
    final products = context.watch<Shop>().shop;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Shop Page'),
        ),
        drawer: const MyDrawer(),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: ListView(
          children: [
            const Center(
              child: Text(
                'Pick from a selected list of premium quality goods',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 600,
              child: ListView.builder(
                itemCount: products.length,
                padding: const EdgeInsets.all(15),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  // get each individual item product from shop
                  final product = products[index];
                  return MyProductTile(product: product);
                },
              ),
            ),
          ],
        ));
  }
}
