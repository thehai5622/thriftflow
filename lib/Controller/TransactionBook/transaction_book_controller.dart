import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thriftflow/Utils/datetime_utils.dart';

// Vẫn chưa ổn phẩn lưu lại Gọi và lấy dữ liệu ra đối với TabView
// Đang tính tới phương án load data trong Splash Screen đưa vào Global value
// Sau đó mới xử lý dữ liệu ở đây.

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
