import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final int price;
  final String info;
  final int? discountPercentage;
  final bool isNew;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.productName,
    required this.price,
    required this.info,
    this.discountPercentage,
    required this.isNew,
  });

  @override
  Widget build(BuildContext context) {
    final NumberFormat currencyFormat =
        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

    double originalPrice = price / 100;

    double discountedPrice =
        discountPercentage != null && discountPercentage! > 0
            ? originalPrice - (originalPrice * discountPercentage! / 100)
            : originalPrice;

    return Column(
      children: [
        const Divider(
          color: Color.fromRGBO(235, 241, 244, 1),
          thickness: 1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Row(
            children: [
              Image.network(
                imageUrl,
                width: 100,
                height: 100,
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (discountPercentage != null && discountPercentage! > 0)
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(0, 180, 204, 1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 6),
                        child: Text(
                          '$discountPercentage% OFF',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    const SizedBox(height: 4.0),
                    Text(
                      productName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 6.0),
                    if (discountPercentage != null && discountPercentage! > 0)
                      Text(
                        currencyFormat.format(originalPrice),
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(124, 144, 148, 1),
                          decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    const SizedBox(height: 6.0),
                    Text(
                      discountPercentage != null && discountPercentage! > 0
                          ? currencyFormat.format(discountedPrice)
                          : currencyFormat.format(originalPrice),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(0, 36, 41, 1),
                      ),
                    ),
                    const SizedBox(height: 6.0),
                    Text(
                      info,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(0, 180, 204, 1),
                      ),
                    ),
                    const SizedBox(height: 6.0),
                    isNew
                        ? const Text(
                            'NOVO',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color.fromRGBO(124, 144, 148, 1),
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(
          color: Color.fromRGBO(235, 241, 244, 1),
          thickness: 1,
        ),
      ],
    );
  }
}
