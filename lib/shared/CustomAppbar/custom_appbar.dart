import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF00B4CC),
      leading: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Buscar',
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            suffixIcon: const Icon(
              Icons.search,
              color: Color(0xFF00B4CC),
            ),
          ),
          style: const TextStyle(height: 1.4),
        ),
      ),
      leadingWidth: double.infinity,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
