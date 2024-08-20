import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final String? currentRoute = ModalRoute.of(context)?.settings.name;

    Color backgroundColor = const Color(0xFF00B4CC);
    String? title;

    if (currentRoute == '/categories') {
      backgroundColor = const Color(0xFFEFEFEF);
      title = 'Categorias';
    }

    return AppBar(
      backgroundColor: backgroundColor,
      leading: title == null
          ? Padding(
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
            )
          : null,
      title: title == null
          ? null
          : Text(
              title,
              style: const TextStyle(color: Colors.black),
            ),
      leadingWidth: title == null ? double.infinity : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
