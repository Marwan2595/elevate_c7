import 'package:elevate_c7/core/constant/ui_strings.dart';
import 'package:elevate_c7/core/theme/app_colors.dart';
import 'package:elevate_c7/features/home/domain/entities/product_entity.dart';
import 'package:elevate_c7/features/home/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductsList extends StatelessWidget {
  final String title;
  final List<ProductEntity> products;
  final VoidCallback? onViewAllTap;

  const ProductsList({
    super.key,
    required this.title,
    required this.products,
    this.onViewAllTap,
  });

  static const double _listHeight = 240;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.darkBlue,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              GestureDetector(
                onTap: onViewAllTap,
                child: const Text(
                  UiStrings.viewAll,
                  style: TextStyle(color: AppColors.darkBlue, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        if (products.isNotEmpty)
          SizedBox(
            height: _listHeight,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: products.length,
              separatorBuilder: (_, _) => const SizedBox(width: 16),
              itemBuilder: (_, index) => ProductCard(product: products[index]),
            ),
          ),
        if (products.isEmpty) Center(child: Text("No Products Found")),
      ],
    );
  }
}
