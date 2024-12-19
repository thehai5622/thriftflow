import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thriftflow/Utils/datetime_utils.dart';

class TransactionBookController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  RxBool isThisTime = true.obs;
  RxBool isPrevious = true.obs;
  // [By Group, By transactions]
  RxString typeTransaction = "all".obs;
  // [day, week, month, quarter, year, all, custom]
  RxString typeTime = "month".obs;
  RxList listTab = [].obs;
  int initTabIndex = 0;
  Map<String, List<Map<String, String>>> timeMap = {
    "day": [],
    "week": [],
    "month": [],
    "quarter": [],
    "year": [],
    "all": [
      {
        "value": "all",
        "title": "Tất cả",
      },
    ],
    "customize": [
      {
        "value": "customize",
        "title": "Tùy chỉnh",
      },
    ]
  };

  @override
  void onInit() async {
    super.onInit();
    listTab.value = DateTimeUtils.getInstance().getListTime(type: 'month');
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
    backToThisTime();
  }

  void backToThisTime() {
    if (tabController.index != initTabIndex) {
      tabController.animateTo(initTabIndex);
    }
  }
}
