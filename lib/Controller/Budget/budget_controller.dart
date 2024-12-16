import 'package:get/get.dart';

class BudgetController extends GetxController {
  RxInt budgetTabIndex = 0.obs;

  changeBudget() {
    budgetTabIndex.value = budgetTabIndex.value == 0 ? 1 : 0;
  }
}