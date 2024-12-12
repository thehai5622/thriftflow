import 'package:get/get.dart';
import 'package:thriftflow/Utils/utils.dart';

class HomeController extends GetxController {
  RxBool isShowBalance = false.obs;
  RxInt reportTabIndex = 0.obs;
  RxInt spendingDetailsTabIndex = 1.obs;
  RxInt reportTrendTabIndex = 0.obs;
  RxInt reportExpenseTabIndex = 0.obs;

  @override
  void onInit() async {
    super.onInit();
    isShowBalance.value = await Utils.getBoolValueWithKey("isShowBalance");
  }

  @override
  void onClose() {
    print('on close second');
    super.onClose();
  }

  changeShowBalance() async {
    isShowBalance.value = !isShowBalance.value;
    await Utils.saveBoolWithKey("isShowBalance", isShowBalance.value);
  }
  
  changeReportTabIndex() {
    reportTabIndex.value = reportTabIndex.value == 0 ? 1 : 0;
  }
}
