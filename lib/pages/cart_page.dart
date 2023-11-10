import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suq_app/components/my_button.dart';

import '../models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeItmeFromCart(BuildContext context, product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text('Are you sure you want to remove it?'),
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
              context.read<Shop>().removeItemFromCart(product);
            },
            child: const Text('Yes'),
          )
        ],
      ),
    );
  }

  void pressedPayButton(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content: Text('Sorry Functionality not implmented'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Cart Page'),
      ),
      body: Column(
        children: [
          Expanded(
            child: cart.isEmpty
                ? const Center(
                    child: Text(
                    'Your Cart is Empty',
                    style: TextStyle(fontSize: 22),
                  ))
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final item = cart[index];

                      return ListTile(
                        title: Text(item.productName),
                        subtitle: Text(item.price.toStringAsFixed(2)),
                        trailing: IconButton(
                          onPressed: () => removeItmeFromCart(context, item),
                          icon: const Icon(Icons.remove),
                        ),
                      );
                    },
                  ),
          ),
          MyButton(
            onTap: () => pressedPayButton(context),
            child: Text('PAY NOW'),
          ),
          const SizedBox(height: 30)
        ],
      ),
    );
  }
}
