import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suq_app/models/product.dart';

import '../models/shop.dart';

class MyProductTile extends StatelessWidget {
  final Product product;

  const MyProductTile({super.key, required this.product});

  void addItemToCart(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text('Add this Item to your cart?'),
        actions: [
          // Cancel button
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          // Yes
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<Shop>().addItemToCart(product);
            },
            child: const Text('Yes'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(25),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product image
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  child: const Icon(Icons.favorite),
                ),
              ),

              const SizedBox(height: 25),
              // product name
              Text(
                product.productName,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),
              // product description
              Text(product.description),
            ],
          ),

          // product price  +  addItemToCart button

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                // ignore: prefer_interpolation_to_compose_strings
                '\$ ' + product.price.toStringAsFixed(2),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    borderRadius: BorderRadius.circular(50)),
                child: IconButton(
                  onPressed: () => addItemToCart(context),
                  icon: const Icon(Icons.add),
                  color: Theme.of(context).colorScheme.secondary,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
