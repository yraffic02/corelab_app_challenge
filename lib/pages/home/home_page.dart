import 'package:corelab_app_challenge/shared/CustomLayout/custom_layout.dart';
import 'package:corelab_app_challenge/shared/CustomProductCard/custom_product_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const CustomLayout(
        child: Column(
      children: [
        ProductCard(
          imageUrl: 'https://via.placeholder.com/100',
          productName: 'Condicionador Ácido Fortificante 37% - AlPrime',
          price: 2900,
          info: 'em até 12x de R\$ 24,17',
          isNew: true,
          discountPercentage: 10,
        ),
      ],
    ));
  }
}
