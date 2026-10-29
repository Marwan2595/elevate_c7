import 'package:elevate_c7/core/constant/ui_strings.dart';
import 'package:elevate_c7/core/theme/app_colors.dart';
import 'package:elevate_c7/core/utils/utils.dart';
import 'package:elevate_c7/features/home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;
  final VoidCallback? onAddTap;
  final VoidCallback? onFavoriteTap;

  const ProductCard({
    super.key,
    required this.product,
    this.onAddTap,
    this.onFavoriteTap,
  });

  static const double width = 160;
  static const double _radius = 15;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(_radius),
        border: Border.all(color: AppColors.cardBorder),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _buildImage()),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.darkBlue,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                if (product.rating != null) _buildRating(),
                const SizedBox(height: 4),
                _buildPriceRow(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          product.imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (_, _, _) => Container(
            color: AppColors.imagePlaceholder,
            child: const Icon(Icons.image_not_supported_outlined),
          ),
        ),
        Positioned(
          top: 6,
          right: 6,
          child: GestureDetector(
            onTap: onFavoriteTap,
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: const BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.favorite_border,
                size: 16,
                color: AppColors.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRating() {
    return Row(
      children: [
        Text(
          '${UiStrings.review} (${product.rating!.toStringAsFixed(1)})',
          style: const TextStyle(color: AppColors.darkBlue, fontSize: 12),
        ),
        const SizedBox(width: 8),
        const Icon(Icons.star, color: AppColors.star, size: 16),
      ],
    );
  }

  Widget _buildPriceRow() {
    return Row(
      children: [
        Expanded(
          child: Text(
            '${UiStrings.currency} ${Utils.formatPrice(product.price)}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: AppColors.darkBlue, fontSize: 12),
          ),
        ),
        InkWell(
          onTap: onAddTap,
          customBorder: const CircleBorder(),
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.add, color: AppColors.white, size: 20),
          ),
        ),
      ],
    );
  }
}
