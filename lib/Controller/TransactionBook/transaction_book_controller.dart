import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thriftflow/Utils/datetime_utils.dart';

class TransactionBookController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  RxBool isThisTime = true.obs;
  RxBool isPrevious = true.obs;
  DateTimeUtils dateTimeUtils = DateTimeUtils.getInstance();
  // [By Group, By transactions]
  RxString typeTransaction = "all".obs;
  // [day, week, month, quarter, year, all, custom]
  RxString typeTime = "month".obs;
  RxList listTab = [].obs;
  int initTabIndex = 0;

  @override
  void onInit() async {
    super.onInit();
    listTab.value = dateTimeUtils.getListTime(type: "month");
    initTabIndex = listTab.length > 2 ? listTab.length - 2 : 0;
    tabController = TabController(
      length: listTab.length,
      vsync: this,
      initialIndex: initTabIndex,
    );
    tabController.addListener(() {
      isThisTime.value = tabController.index == initTabIndex;
      isPrevious.value = tabController.index > initTabIndex;
    });
    // await Utils.getStringValueWithKey("TransactionBook-typeTime");
    backToThisTime();
  }

  void backToThisTime() {
    if (tabController.index != initTabIndex) {
      tabController.animateTo(initTabIndex);
    }
  }
}
