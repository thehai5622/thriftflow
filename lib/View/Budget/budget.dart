import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:thriftflow/Component/popup_menu.dart';
import 'package:thriftflow/Controller/Budget/budget_controller.dart';
import 'package:thriftflow/Global/app_color.dart';
import 'package:thriftflow/Route/app_page.dart';
import 'package:thriftflow/Service/device_helper.dart';

class Budget extends StatelessWidget {
  Budget({super.key});

  final controller = Get.put(BudgetController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.main,
        foregroundColor: AppColor.text1,
        elevation: 0,
        shadowColor: AppColor.text1,
        title: Obx(
          () => Text(
            "Ngân sách ${controller.budgetTabIndex.value == 0 ? 'đang áp dụng' : 'đã kết thúc'}",
            style: TextStyle(
              fontSize: DeviceHelper.getFontSize(21),
              color: AppColor.text1,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        actions: [
          GestureDetector(
              onTap: () {
                Get.toNamed(Routes.walletOverview);
              },
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/wallet-all.svg",
                    height: 25,
                    width: 25,
                  ),
                  const Icon(
                    Icons.arrow_drop_down_rounded,
                    size: 20,
                    color: AppColor.grey,
                  ),
                ],
              )),
          const SizedBox(width: 20),
          MyPopupMenu(
            itemMenu: [
              PopupMenuItem(
                onTap: () => controller.changeBudget(),
                child: Obx(
                  () => Text(
                    controller.budgetTabIndex.value == 0
                      ? "Xem ngân sách đã kết thúc" : "Xem ngân sách đang áp dụng",
                    style: TextStyle(
                      fontSize: DeviceHelper.getFontSize(14),
                      color: AppColor.text1,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
            child: const Icon(
              Icons.more_vert,
              size: 25,
              color: AppColor.text1,
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: Container(
        color: AppColor.subMain,
        child: Center(
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SvgPicture.asset(
                  "assets/icons/empty-box.svg",
                  width: 150,
                  height: 150,
                ),
                Text(
                  controller.budgetTabIndex.value == 0
                      ? "Bạn chưa có nhân sách"
                      : "Không có dữ liệu để hiển thị",
                  style: TextStyle(
                    fontSize: DeviceHelper.getFontSize(15),
                    color: AppColor.text1,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (controller.budgetTabIndex.value == 0)
                  Column(
                    children: [
                      Text(
                        "Bắt đầu tiết kiệm bằng cách tạo ngân sách và chúng tôi sẽ giúp bạn kiểm soát ngân sách.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: DeviceHelper.getFontSize(14),
                          color: AppColor.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ).marginSymmetric(horizontal: 20, vertical: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.fourthMain,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(26),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 70),
                        ),
                        onPressed: () {
                          // Create budget
                        },
                        child: Text(
                          "Tạo ngân sách",
                          style: TextStyle(
                            fontSize: DeviceHelper.getFontSize(14),
                            color: AppColor.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ).marginSymmetric(horizontal: 15, vertical: 10),
                      Text(
                        "Sử dụng ngân sách như thế nào?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: DeviceHelper.getFontSize(14),
                          color: AppColor.fourthMain,
                          fontWeight: FontWeight.w500,
                        ),
                      ).marginSymmetric(horizontal: 20),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
