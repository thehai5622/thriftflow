import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionBookController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  RxInt type = 0.obs;
  RxBool isThisTime = true.obs;
  bool isPrevious = true;
  List<dynamic> listTab = [
    "11/2024",
    "Tháng trước",
    "Tháng này",
    "Tương lai",
  ];

  @override
  void onInit() {
    super.onInit();

    tabController = TabController(
      length: 4,
      vsync: this,
      initialIndex: listTab.length - 2,
    );

    tabController.addListener(() {
      isThisTime.value = tabController.index == listTab.length - 2;
      isPrevious = tabController.index > listTab.length - 2;
    });
  }

  backToThisTime() {
    if (tabController.index != listTab.length - 2) {
      tabController.animateTo(2);
    }
  }
}
