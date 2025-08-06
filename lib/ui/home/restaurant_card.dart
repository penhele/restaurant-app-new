import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../data/model/restaurant.dart';
import '../../utils/constants/sizes.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({super.key, required this.restaurant});

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      constraints: BoxConstraints(maxWidth: screenWidth * 0.9),
      margin: const EdgeInsets.symmetric(
        vertical: SSizes.sm,
        horizontal: SSizes.md,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(SSizes.cardRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            offset: const Offset(0, 2),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(SSizes.cardRadius),
            ),
            child: Image.network(
              'https://restaurant-api.dicoding.dev/images/small/${restaurant.pictureId}',
              height: 100,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: SSizes.spaceBtwItems),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(restaurant.name),
              const SizedBox(height: SSizes.spaceBtwMenus),

              Row(
                children: [
                  const Icon(Iconsax.location4, size: SSizes.iconSize),
                  const SizedBox(width: SSizes.spaceBtwMenus),

                  Text(restaurant.city),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
