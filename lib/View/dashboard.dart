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
          print('on long press');
        },
        child: FloatingActionButton(
          backgroundColor: AppColor.fourthMain,
          elevation: 0,
          shape: const CircleBorder(),
          onPressed: () {
            print('on press');
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
        elevation: 5,
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
}
