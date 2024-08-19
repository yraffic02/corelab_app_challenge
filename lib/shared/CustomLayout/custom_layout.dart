import 'package:corelab_app_challenge/shared/CustomAppbar/custom_appbar.dart';
import 'package:flutter/material.dart';

class CustomLayout extends StatefulWidget {
  final Widget child;

  const CustomLayout({super.key, required this.child});

  @override
  State<CustomLayout> createState() => _CustomLayoutState();
}

class _CustomLayoutState extends State<CustomLayout> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppbar(),
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'Anunciar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Conta',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF00B4CC),
        unselectedItemColor: const Color(0xFF7C9094),
        onTap: _onItemTapped,
      ),
    );
  }
}
