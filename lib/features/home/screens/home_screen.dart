import 'package:firebase_ecom/app/constants.dart';
import 'package:firebase_ecom/core/ui/widgets/custom_app_bar.dart';
import 'package:firebase_ecom/core/utils/device/size_utils.dart';
import 'package:firebase_ecom/features/home/widgets/app_bar_item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: AppBarItem(icon: Icons.menu, onTap: () {}),
        actions: [AppBarItem(icon: Icons.search, onTap: () {})],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.w),
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
        ),
      ),
    );
  }
}
