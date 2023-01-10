import 'dart:developer';

import 'package:get/get.dart';

class PageIndexController extends GetxController {
  var currentPage = 0.obs;
  // int get currentPage => _currentPage.value;
  // set currentPage(int value) => _currentPage.value = value;

  navigateToTab(RxInt page) {
    log(page.value.toString());
    currentPage = page;
  }
}
