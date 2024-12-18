import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:thriftflow/Controller/TransactionBook/transaction_book_controller.dart';
import 'package:thriftflow/Global/app_color.dart';
import 'package:thriftflow/Route/app_page.dart';
import 'package:thriftflow/Service/device_helper.dart';

class TransactionBook extends StatelessWidget {
  TransactionBook({super.key});

  final controller = Get.put(TransactionBookController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.sp),
        child: Container(
          color: AppColor.main,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: SafeArea(
                  child: Stack(
                    children: [
                      SizedBox(
                        height: double.maxFinite,
                        width: double.maxFinite,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              "Số dư",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: DeviceHelper.getFontSize(14),
                                color: AppColor.grey,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "15,000",
                                  style: TextStyle(
                                    fontSize: DeviceHelper.getFontSize(16),
                                    color: AppColor.text1,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "đ",
                                  style: TextStyle(
                                    fontSize: DeviceHelper.getFontSize(16),
                                    color: AppColor.text1,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.walletOverview);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColor.subMain,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icons/wallet-all.svg",
                                        height: 25,
                                        width: 25,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        "Tổng cộng",
                                        style: TextStyle(
                                          fontSize:
                                              DeviceHelper.getFontSize(14),
                                          color: AppColor.text1,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.arrow_drop_down_rounded,
                                        size: 20,
                                        color: AppColor.grey,
                                      ),
                                    ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 5,
                        right: 16,
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/search.svg",
                              height: 25,
                              width: 25,
                              colorFilter: const ColorFilter.mode(
                                AppColor.text1,
                                BlendMode.srcIn,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(
                              Icons.more_vert,
                              size: 25,
                              color: AppColor.text1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              TabBar(
                unselectedLabelColor: AppColor.grey,
                labelColor: AppColor.text1,
                dividerColor: AppColor.subMain,
                isScrollable: true,
                indicatorColor: AppColor.text1,
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                tabs: controller.listTab.map((e) => Tab(text: e)).toList(),
                controller: controller.tabController,
                indicatorSize: TabBarIndicatorSize.tab,
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: AppColor.subMain,
        child: TabBarView(
          controller: controller.tabController,
          children: controller.listTab
              .asMap()
              .map((i, e) => MapEntry(
                  i,
                  Center(
                    child: Text("Screen $i"),
                  )))
              .values
              .toList(),
        ),
      ),
      floatingActionButton: Obx(
        () => controller.isThisTime.value
            ? const SizedBox()
            : FloatingActionButton.small(
                backgroundColor: AppColor.thirdMain,
                elevation: 0,
                onPressed: () {
                  controller.backToThisTime();
                },
                child: controller.isPrevious
                    ? SvgPicture.asset(
                        "assets/icons/previous.svg",
                        height: 20,
                        width: 20,
                        colorFilter: const ColorFilter.mode(
                          AppColor.text1,
                          BlendMode.srcIn,
                        ),
                      )
                    : SvgPicture.asset(
                        "assets/icons/next.svg",
                        height: 20,
                        width: 20,
                        colorFilter: const ColorFilter.mode(
                          AppColor.text1,
                          BlendMode.srcIn,
                        ),
                      ),
              ),
      ),
    );
  }
}
