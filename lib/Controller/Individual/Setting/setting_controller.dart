import 'package:get/get.dart';

class SettingController extends GetxController {
  RxBool isIncludedInTheReport = true.obs;
  RxBool isShowDetailTransaction = true.obs;
  RxBool isShowSoundNotification = true.obs;
  RxBool isSyncOverWifiOnly = true.obs;
}
