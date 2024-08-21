import 'package:flutter/material.dart';
import 'package:corelab_app_challenge/shared/CustomLayout/custom_layout.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _searchController = TextEditingController();
  List<String> historyList = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
    getHistory();
  }

  getHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> history = prefs.getStringList('search_history') ?? [];

    setState(() {
      historyList = history;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomLayout(
      focusNode: _focusNode,
      searchController: _searchController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 25, 0, 10),
            child: Text(
              'Pesquisas recentes',
              style: TextStyle(
                  color: Color.fromRGBO(0, 36, 41, 1),
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: historyList.length,
              itemBuilder: (context, index) {
                final item = historyList[index];
                return ListTile(
                  leading: const Icon(
                    Icons.access_time,
                    color: Color.fromRGBO(124, 144, 148, 1),
                  ),
                  title: Text(
                    item,
                    style: const TextStyle(
                        color: Color.fromRGBO(124, 144, 148, 1),
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                  onTap: () {
                    _searchController.text = item;
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
