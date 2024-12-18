import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thriftflow/Utils/utils.dart';

class TransactionBookController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  RxBool isThisTime = true.obs;
  RxBool isPrevious = true.obs;
  RxString type = "month".obs;
  RxList<dynamic> listTab = [].obs;
  int initTabIndex = 0;

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
    print("test: ${await Utils.getStringValueWithKey("transaction_book-type")}");
  }

  void backToThisTime() {
    if (tabController.index != initTabIndex) {
      tabController.animateTo(initTabIndex);
    }
  }
}
