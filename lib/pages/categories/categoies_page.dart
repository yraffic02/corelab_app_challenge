import 'package:corelab_app_challenge/shared/CustomLayout/custom_layout.dart';
import 'package:corelab_app_challenge/shared/utils/constants.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return CustomLayout(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            Constants.categories().length,
            (index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(20, 14, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Constants.categories()[index],
                      style: const TextStyle(
                        color: Color(0xFF00B4CC),
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    if (index != Constants.categories().length - 1)
                      Container(
                        height: 1.0,
                        color: const Color(0xFFEBF1F4),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
