import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../data/model/restaurant.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_functions.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({super.key, required this.restaurant});

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    final isDark = SHelperFunctions.isDarkMode(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      constraints: BoxConstraints(maxWidth: screenWidth * 0.9),
      margin: const EdgeInsets.symmetric(
        vertical: SSizes.sm,
        horizontal: SSizes.md,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(SSizes.cardRadius),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withValues(alpha: 0.2)
                : Colors.grey.withValues(alpha: 0.1),
            offset: const Offset(0, 2),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Stack(
        children: [
          Row(
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
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.broken_image);
                  },
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
                      const Icon(Iconsax.location4, size: SSizes.iconSizeMd),
                      const SizedBox(width: SSizes.spaceBtwIconAndText),

                      Text(restaurant.city),
                    ],
                  ),
                ],
              ),
            ],
          ),

          Positioned(
            top: 0,
            right: 0,
            width: 55,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: SSizes.sm,
                vertical: SSizes.xs,
              ),
              decoration: BoxDecoration(
                color: isDark ? SColors.darkStarColor : SColors.lightStarColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(SSizes.cardRadius),
                  bottomLeft: Radius.circular(SSizes.cardRadius),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Iconsax.star,
                    size: SSizes.iconSizeSm,
                    color: SColors.darkText,
                  ),
                  const SizedBox(width: SSizes.spaceBtwIconAndText),

                  Text(
                    restaurant.rating.toString(),
                    style: const TextStyle(color: SColors.darkText),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
