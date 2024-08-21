import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {
  final FocusNode? focusNode;
  final TextEditingController? searchController;

  const CustomAppbar({super.key, this.focusNode, this.searchController});

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppbarState extends State<CustomAppbar> {
  late TextEditingController _localSearchController;

  @override
  void initState() {
    super.initState();
    _localSearchController = widget.searchController ?? TextEditingController();
    _localSearchController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    if (widget.searchController == null) {
      _localSearchController.dispose();
    }
    super.dispose();
  }

  Future<void> _saveSearchHistory(String query) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> history = prefs.getStringList('search_history') ?? [];

    if (!history.contains(query)) {
      history.add(query);
      await prefs.setStringList('search_history', history);
    }
  }

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
          ? Row(
              children: [
                currentRoute == '/search'
                    ? IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    : const SizedBox(
                        width: 10,
                      ),
                Expanded(
                  child: TextField(
                    controller: _localSearchController,
                    focusNode: widget.focusNode,
                    onTap: () {
                      if (currentRoute != '/search') {
                        Navigator.pushNamed(context, '/search');
                      }
                    },
                    onSubmitted: (String value) async {
                      await _saveSearchHistory(value);
                      _localSearchController.clear();
                    },
                    decoration: InputDecoration(
                      hintText: 'Buscar',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 8),
                      suffixIcon: _localSearchController.text.isNotEmpty
                          ? IconButton(
                              icon: const Icon(
                                Icons.clear,
                                color: Color.fromRGBO(173, 187, 191, 1),
                                size: 24,
                              ),
                              onPressed: () {
                                _localSearchController.clear();
                              },
                            )
                          : const Icon(
                              Icons.search,
                              color: Color(0xFF00B4CC),
                            ),
                    ),
                    style: const TextStyle(height: 1.4),
                  ),
                ),
                if (currentRoute == '/search')
                  const SizedBox(
                    width: 10,
                  ),
                if (currentRoute == '/search')
                  const Text(
                    'Filtros',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                const SizedBox(
                  width: 10,
                )
              ],
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
}
