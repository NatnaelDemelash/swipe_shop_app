import 'package:flutter/material.dart';
import 'package:suq_app/components/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Drawer Header Logo
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const DrawerHeader(
                  child: Icon(
                    Icons.shopping_bag,
                    size: 70,
                  ),
                ),

                // Shop
                MyListTile(
                  text: const Text('Shop', style: TextStyle(fontSize: 18)),
                  icon: Icons.home,
                  onTap: () => Navigator.pop(context),
                ),

                // Cart
                MyListTile(
                  text: const Text('Cart', style: TextStyle(fontSize: 18)),
                  icon: Icons.shopping_cart,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/cart-page');
                  },
                ),

                // Setting
                MyListTile(
                  text: const Text('Settings', style: TextStyle(fontSize: 18)),
                  icon: Icons.settings,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/settings-page');
                  },
                ),
              ],
            ),

            // Exit
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: MyListTile(
                text: const Text('Exit', style: TextStyle(fontSize: 18)),
                icon: Icons.exit_to_app,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/intro-page');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
