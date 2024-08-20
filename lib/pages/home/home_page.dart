import 'package:corelab_app_challenge/shared/CustomLayout/custom_layout.dart';
import 'package:corelab_app_challenge/shared/CustomProductCard/custom_product_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomLayout(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 10),
            color: const Color(0xFFEFEFEF),
            width: double.infinity,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Últimos anúncios',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF002429),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text('Hoje')
              ],
            ),
          ),
          const ProductCard(
            imageUrl: 'https://via.placeholder.com/100',
            productName: 'Condicionador Ácido Fortificante 37% - AlPrime',
            price: 2900,
            info: 'em até 12x de R\$ 24,17',
            isNew: true,
            discountPercentage: 0,
          ),
          const ProductCard(
            imageUrl: 'https://via.placeholder.com/100',
            productName: 'Condicionador Ácido Fortificante 37% - AlPrime',
            price: 2900,
            info: 'em até 12x de R\$ 24,17',
            isNew: true,
            discountPercentage: 10,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            color: const Color(0xFFEFEFEF),
            width: double.infinity,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text('Ontem')],
            ),
          ),
          const ProductCard(
            imageUrl: 'https://via.placeholder.com/100',
            productName: 'Condicionador Ácido Fortificante 37% - AlPrime',
            price: 2900,
            info: 'em até 12x de R\$ 24,17',
            isNew: true,
            discountPercentage: 30,
          ),
          const ProductCard(
            imageUrl: 'https://via.placeholder.com/100',
            productName: 'Condicionador Ácido Fortificante 37% - AlPrime',
            price: 2900,
            info: 'em até 12x de R\$ 24,17',
            isNew: true,
            discountPercentage: 50,
          ),
          const ProductCard(
            imageUrl: 'https://via.placeholder.com/100',
            productName: 'Condicionador Ácido Fortificante 37% - AlPrime',
            price: 2900,
            info: 'em até 12x de R\$ 24,17',
            isNew: true,
            discountPercentage: 0,
          ),
          const ProductCard(
            imageUrl: 'https://via.placeholder.com/100',
            productName: 'Condicionador Ácido Fortificante 37% - AlPrime',
            price: 2900,
            info: 'em até 12x de R\$ 24,17',
            isNew: true,
            discountPercentage: 0,
          ),
        ],
      ),
    ));
  }
}
