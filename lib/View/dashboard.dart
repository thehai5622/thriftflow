import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:thriftflow/Controller/dashboard_controller.dart';
import 'package:thriftflow/Global/app_color.dart';
import 'package:thriftflow/Service/device_helper.dart';
import 'package:thriftflow/View/Budget/budget.dart';
import 'package:thriftflow/View/Home/home.dart';
import 'package:thriftflow/View/Individual/individual.dart';
import 'package:thriftflow/View/TransactionBook/transaction_book.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  final controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        onLongPress: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                padding: const EdgeInsets.only(bottom: 30, top: 10),
                width: double.infinity,
                color: AppColor.main,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    bottomSheetItem(
                      icon: "assets/icons/ultils-bill.svg",
                      title: "Thêm hóa đơn",
                    ),
                    bottomSheetItem(
                      icon: "assets/icons/ultils-periodic.svg",
                      title: "Thêm giao dịch định kì",
                    ),
                    bottomSheetItem(
                      icon: "assets/icons/ultils-add.svg",
                      title: "Thêm giao dịch trong tương lai",
                    ),
                  ],
                ),
              );
            },
          ).then((value) {});
        },
        child: FloatingActionButton(
          backgroundColor: AppColor.fourthMain,
          elevation: 0,
          shape: const CircleBorder(),
          onPressed: () {
            // Go to add new transaction
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
      body: Obx(() {
        switch (controller.currentIndex.value) {
          case 0:
            return Home();
          case 1:
            return TransactionBook();
          case 2:
            return Budget();
          case 3:
            return Individual();
          default:
            return Container();
        }
      }),
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        shadowColor: AppColor.text1,
        color: AppColor.main,
        shape: const CircularNotchedRectangle(),
        child: Obx(
          () => Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Trang Tổng quan
                Expanded(
                  child: GestureDetector(
                    onTap: () => controller.changePage(0),
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/home_hashtag.svg',
                            colorFilter: controller.currentIndex.value == 0
                                ? const ColorFilter.mode(
                                    AppColor.fourthMain, BlendMode.srcIn)
                                : null,
                          ),
                          Text(
                            'Tổng quan',
                            textAlign: TextAlign.center,
                            style: controller.currentIndex.value == 0
                                ? TextStyle(
                                    fontSize: DeviceHelper.getFontSize(12),
                                    color: AppColor.fourthMain,
                                    fontWeight: FontWeight.w700)
                                : TextStyle(
                                    fontSize: DeviceHelper.getFontSize(12),
                                    color: Colors.grey,
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Trang sổ giao dịch
                Expanded(
                  child: GestureDetector(
                    onTap: () => controller.changePage(1),
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/wallet.svg',
                            height: 20,
                            width: 20,
                            colorFilter: controller.currentIndex.value == 1
                                ? const ColorFilter.mode(
                                    AppColor.fourthMain, BlendMode.srcIn)
                                : null,
                          ),
                          Text(
                            'Sổ giao dịch',
                            textAlign: TextAlign.center,
                            style: controller.currentIndex.value == 1
                                ? TextStyle(
                                    fontSize: DeviceHelper.getFontSize(12),
                                    color: AppColor.fourthMain,
                                    fontWeight: FontWeight.w700)
                                : TextStyle(
                                    fontSize: DeviceHelper.getFontSize(12),
                                    color: Colors.grey,
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 35.w),

                // Trang ngân sách
                Expanded(
                  child: GestureDetector(
                    onTap: () => controller.changePage(2),
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/budget.svg',
                            height: 20,
                            width: 20,
                            colorFilter: controller.currentIndex.value == 2
                                ? const ColorFilter.mode(
                                    AppColor.fourthMain, BlendMode.srcIn)
                                : null,
                          ),
                          Text(
                            'Ngân sách',
                            textAlign: TextAlign.center,
                            style: controller.currentIndex.value == 2
                                ? TextStyle(
                                    fontSize: DeviceHelper.getFontSize(12),
                                    color: AppColor.fourthMain,
                                    fontWeight: FontWeight.w700)
                                : TextStyle(
                                    fontSize: DeviceHelper.getFontSize(12),
                                    color: Colors.grey,
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Trang Cá nhân
                Expanded(
                  child: GestureDetector(
                    onTap: () => controller.changePage(3),
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/user_octagon.svg',
                            colorFilter: controller.currentIndex.value == 3
                                ? const ColorFilter.mode(
                                    AppColor.fourthMain, BlendMode.srcIn)
                                : null,
                          ),
                          Text(
                            'Cá nhân',
                            textAlign: TextAlign.center,
                            style: controller.currentIndex.value == 3
                                ? TextStyle(
                                    fontSize: DeviceHelper.getFontSize(12),
                                    color: AppColor.fourthMain,
                                    fontWeight: FontWeight.w700)
                                : TextStyle(
                                    fontSize: DeviceHelper.getFontSize(12),
                                    color: Colors.grey,
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  GestureDetector bottomSheetItem({
    required String icon,
    required String title,
    void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: const BoxDecoration(
          color: AppColor.main,
          border: Border(
            bottom: BorderSide(
              color: AppColor.subMain,
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              height: 25,
              width: 25,
              colorFilter: const ColorFilter.mode(
                AppColor.grey,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 25),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: DeviceHelper.getFontSize(14),
                  color: AppColor.text1,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
