import 'package:firebase_ecom/app/asset_paths.dart';
import 'package:firebase_ecom/core/utils/device/size_utils.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final String? oldPrice;
  final VoidCallback onTap;
  final VoidCallback onFavoriteTap;
  final bool isFavorite;
  final String? assetPath;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    this.oldPrice,
    required this.onTap,
    required this.onFavoriteTap,
    this.isFavorite = false,
    this.assetPath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(16), // reduced
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // 🔥 important
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image + Favorite
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.h), // 🔥 reduced
                    child: SizedBox(
                      height: 100.h, // 🔥 fixed height
                      width: double.infinity,
                      child: Image.asset(
                        assetPath ?? AssetPaths.staticProductItem,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 6.h,
                  right: 6.w,
                  child: GestureDetector(
                    onTap: onFavoriteTap,
                    child: CircleAvatar(
                      radius: 14.r, // reduced
                      backgroundColor: Colors.white,
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        size: 16.r,
                        color: isFavorite ? Colors.red : Colors.grey.shade400,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Text
            Padding(
              padding: EdgeInsets.fromLTRB(10.w, 6.h, 10.w, 8.h), // reduced
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.h, // slightly smaller
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Text(
                        "₦ $price",
                        style: TextStyle(
                          fontSize: 16.h,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (oldPrice != null) ...[
                        SizedBox(width: 6.w),
                        Text(
                          "₦ $oldPrice",
                          style: TextStyle(
                            fontSize: 12.h,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
