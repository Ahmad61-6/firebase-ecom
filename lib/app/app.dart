import 'package:firebase_ecom/app/app_theme.dart';
import 'package:firebase_ecom/core/utils/device/size_utils.dart';
import 'package:firebase_ecom/features/auth/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirebaseEcom extends StatelessWidget {
  const FirebaseEcom({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightThemeData,
          home: const SplashScreen(),
        );
      },
    );
  }
}
