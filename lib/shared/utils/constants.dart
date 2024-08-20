import 'package:corelab_app_challenge/pages/categories/categoies_page.dart';
import 'package:flutter/material.dart';

class Constants {
  static Map<String, Widget Function(BuildContext)> buildRoutes(
      BuildContext context) {
    return {'/Categorias': (context) => const CategoriesPage()};
  }

  static List<String> categories() {
    return [
      'Anestésicos e Agulhas Gengival',
      'Biossegurança',
      'Descartáveis',
      'Dentística e Estética',
      'Ortodontia',
      'Endodontia',
      'Periféricos e Peças de Mão',
      'Moldagem',
      'Prótese',
      'Cimentos',
      'Instrumentos',
      'Cirurgia e Periodontia',
      'Radiologia'
    ];
  }
}
