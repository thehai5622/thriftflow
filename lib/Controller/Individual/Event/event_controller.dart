import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void onInit() async {
    super.onInit();
    tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
    );
  }
}
