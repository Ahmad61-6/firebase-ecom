import 'package:firebase_ecom/app/app_colors.dart';
import 'package:firebase_ecom/app/asset_paths.dart';
import 'package:firebase_ecom/app/constants.dart';
import 'package:firebase_ecom/core/ui/widgets/custom_app_bar.dart';
import 'package:firebase_ecom/core/utils/device/size_utils.dart';
import 'package:firebase_ecom/features/home/widgets/app_bar_item.dart';
import 'package:firebase_ecom/features/home/widgets/home_carousel_slider.dart';
import 'package:flutter/material.dart';

import '../widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> bannerList = [
    "https://static.vecteezy.com/system/resources/thumbnails/002/006/774/small/paper-art-shopping-online-on-smartphone-and-new-buy-sale-promotion-backgroud-for-banner-market-ecommerce-free-vector.jpg",
    "https://t3.ftcdn.net/jpg/04/65/46/52/360_F_465465254_1pN9MGrA831idD6zIBL7q8rnZZpUCQTy.jpg",
    "https://img.freepik.com/free-vector/gradient-shopping-discount-horizontal-sale-banner_23-2150321996.jpg?semt=ais_hybrid&w=740&q=80",
    "https://static.vecteezy.com/system/resources/thumbnails/008/601/839/small/online-shopping-background-design-free-vector.jpg",
    "https://img.freepik.com/free-psd/black-friday-super-sale-facebook-cover-banner-template_120329-5177.jpg?semt=ais_hybrid&w=740&q=80",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: AppBarItem(icon: Icons.menu, onTap: () {}),
        actions: [AppBarItem(icon: Icons.search, onTap: () {})],
      ),
      body: CustomScrollView(
        slivers: [
          // Heading
          SliverToBoxAdapter(child: ScreenHeading()),

          // Banner carousel
          SliverToBoxAdapter(child: HomeCarouselSlider(bannerList: bannerList)),

          SliverToBoxAdapter(child: SizedBox(height: 20.h)),

          // Top category title
          SliverToBoxAdapter(child: HomeScreenTopCategorySection()),

          SliverToBoxAdapter(child: SizedBox(height: 25.h)),

          // Horizontal category list
          SliverToBoxAdapter(
            child: SizedBox(
              height: 70.h,
              child: ListView.builder(
                padding: EdgeInsets.only(left: 12.w),
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Container(
                      width: 70.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.catBackgroundColor,
                        border: Border.all(
                          width: 2,
                          color: Colors.black.withValues(alpha: .1),
                        ),
                        image: DecorationImage(
                          image: AssetImage(AssetPaths.categoryList[index]),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          SliverToBoxAdapter(child: SizedBox(height: 20.h)),

          // 🔥 Product Grid (MAIN LIST)
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12.h,
                crossAxisSpacing: 10.w,
                childAspectRatio: 0.95, // 🔥 optimized
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return ProductCard(
                    imageUrl: "https://via.placeholder.com/150",
                    title: "Product $index",
                    price: "1200",
                    oldPrice: "1500",
                    onTap: () {},
                    onFavoriteTap: () {},
                  );
                },
                childCount: 10,
                addRepaintBoundaries: true, // 🔥 performance
              ),
            ),
          ),

          SliverToBoxAdapter(child: SizedBox(height: 30.h)),
        ],
      ),
    );
  }
}

class HomeScreenTopCategorySection extends StatelessWidget {
  const HomeScreenTopCategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.h),
      child: Row(
        children: [
          Text(
            AppConstants.homeScreenText3,
            style: TextStyle(fontSize: 24.h, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          TextButton(
            onPressed: () {},
            child: Text(
              "View All",
              style: TextStyle(fontSize: 16.h, color: AppColors.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}

class ScreenHeading extends StatelessWidget {
  const ScreenHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.w),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            AppConstants.homeScreenText1,
            style: TextStyle(fontSize: 25.h, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5.h),
          Text(
            AppConstants.homeScreenText2,
            style: TextStyle(
              fontSize: 15.h,
              color: Colors.black.withValues(alpha: 0.5),
            ),
          ),
        ],
      ),
    );
  }
}
