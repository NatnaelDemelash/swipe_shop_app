import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final Widget text;
  final IconData icon;
  final void Function()? onTap;

  const MyListTile({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon),
        title: text,
      ),
    );
  }
}
