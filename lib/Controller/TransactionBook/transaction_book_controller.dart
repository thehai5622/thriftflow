import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionBookController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  RxInt type = 0.obs;
  List<Map<String, Object>> listTab = [];

  @override
  void onInit() {
    super.onInit();

    tabController = TabController(
      length: 4,
      vsync: this,
      initialIndex: 2,
    );

    tabController.addListener(() {
      print(tabController.index);
    });
  }
}
