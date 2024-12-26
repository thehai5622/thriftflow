import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  RxBool isShowInactiveGroup = false.obs;

  @override
  void onInit() async {
    super.onInit();
    tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: 0,
    );
  }

  changeShowExtendGroup() {
    isShowInactiveGroup.value = !isShowInactiveGroup.value;
  }
}
