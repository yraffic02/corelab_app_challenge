import 'package:corelab_app_challenge/pages/categories/categoies_page.dart';
import 'package:flutter/material.dart';

class Constants {
  static Map<String, Widget Function(BuildContext)> buildRoutes(
      BuildContext context) {
    return {'/Categorias': (context) => const CategoriesPage()};
  }
}
