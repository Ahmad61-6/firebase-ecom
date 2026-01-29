import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../app/app_colors.dart';
import '../../../core/utils/device/size_utils.dart';

class HomeCarouselSlider extends StatefulWidget {
  final List<String> bannerList;

  const HomeCarouselSlider({super.key, required this.bannerList});

  @override
  State<HomeCarouselSlider> createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {
  final ValueNotifier<int> _current = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: widget.bannerList.length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: NetworkImage(widget.bannerList[itemIndex]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
          options: CarouselOptions(
            onPageChanged: (int currentIndex, _) {
              _current.value = currentIndex;
            },
            height: 150.h,
            autoPlay: true,
            pauseAutoPlayOnTouch: true,
            // aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(seconds: 1),
            enlargeFactor: 0.3,
            autoPlayCurve: Curves.fastOutSlowIn,
          ),
        ),
        SizedBox(height: 8.h),
        ValueListenableBuilder(
          valueListenable: _current,
          builder: (context, index, _) {
            return Row(
              mainAxisAlignment: .center,
              children: [
                for (int i = 0; i < widget.bannerList.length; i++)
                  Container(
                    width: 8.h,
                    height: 8.h,
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.primaryColor,
                        width: 1,
                      ),
                      shape: BoxShape.circle,
                      color: i == index ? AppColors.primaryColor : null,
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
