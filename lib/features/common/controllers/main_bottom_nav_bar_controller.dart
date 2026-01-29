import 'package:get/get.dart';

class MainBottomNavBarController extends GetxController {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void changeIndex(int index) {
    if (_currentIndex == index) return;
    _currentIndex = index;
    update();
  }

  void backToHome() {
    changeIndex(0);
  }
}
