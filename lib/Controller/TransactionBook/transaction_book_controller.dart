import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionBookController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  RxBool isThisTime = true.obs;
  RxBool isPrevious = true.obs;
  // [By Group, By transactions]
  RxString typeTransaction = "all".obs;
  // [day, week, month, quarter, year, all, custom]
  RxString typeTime = "month".obs;
  RxList<dynamic> listTab = [].obs;
  int initTabIndex = 0;
  var timeMap = {
    "day": "",
    "week": "Tính tuần",
    "month": "Tháng",
    "quarter": "Quý",
    "year": "Nam",
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
    listTab.value = [
      "05/2024",
      "06/2024",
      "07/2024",
      "08/2024",
      "09/2024",
      "10/2024",
      "11/2024",
      "Tháng trước",
      "Tháng này",
      "Tương lai",
    ];
    // listTab = ["Tất cả"];
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
