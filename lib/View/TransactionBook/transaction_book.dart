import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:thriftflow/Component/popup_menu.dart';
import 'package:thriftflow/Controller/TransactionBook/transaction_book_controller.dart';
import 'package:thriftflow/Global/app_color.dart';
import 'package:thriftflow/Route/app_page.dart';
import 'package:thriftflow/Service/device_helper.dart';
import 'package:thriftflow/Utils/datetime_utils.dart';

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
                            GestureDetector(
                              onTap: () {
                                print(DateTimeUtils.getInstance()
                                    .getListTime(type: 'year'));
                              },
                              child: SvgPicture.asset(
                                "assets/icons/search.svg",
                                height: 25,
                                width: 25,
                                colorFilter: const ColorFilter.mode(
                                  AppColor.text1,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            MyPopupMenu(
                              itemMenu: [
                                PopupMenuItem(
                                  onTap: () => _showDialog(context),
                                  child: Text(
                                    "Khoảng thời gian",
                                    style: TextStyle(
                                      fontSize: DeviceHelper.getFontSize(14),
                                      color: AppColor.text1,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                PopupMenuItem(
                                  child: Text(
                                    "Xem theo nhóm",
                                    style: TextStyle(
                                      fontSize: DeviceHelper.getFontSize(14),
                                      color: AppColor.text1,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                PopupMenuItem(
                                  child: Text(
                                    "Điều chỉnh số dư",
                                    style: TextStyle(
                                      fontSize: DeviceHelper.getFontSize(14),
                                      color: AppColor.text1,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                PopupMenuItem(
                                  child: Text(
                                    "chuyển tiền đến ví khác",
                                    style: TextStyle(
                                      fontSize: DeviceHelper.getFontSize(14),
                                      color: AppColor.text1,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                PopupMenuItem(
                                  child: Text(
                                    "Đồng bộ hóa",
                                    style: TextStyle(
                                      fontSize: DeviceHelper.getFontSize(14),
                                      color: AppColor.text1,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                PopupMenuItem(
                                  child: Text(
                                    "Sửa ví",
                                    style: TextStyle(
                                      fontSize: DeviceHelper.getFontSize(14),
                                      color: AppColor.text1,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                PopupMenuItem(
                                  child: Text(
                                    "Chia sẻ ví",
                                    style: TextStyle(
                                      fontSize: DeviceHelper.getFontSize(14),
                                      color: AppColor.text1,
                                      fontWeight: FontWeight.w500,
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
                tabs: controller.listTab
                    .map((value) => Tab(text: value['title']))
                    .toList(),
                controller: controller.tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 16),
                tabAlignment: TabAlignment.center,
                labelStyle: TextStyle(
                  fontSize: DeviceHelper.getFontSize(14),
                  fontWeight: FontWeight.w500,
                ),
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
              .map((index, element) => MapEntry(
                  index,
                  Container(
                    color: AppColor.subMain,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/empty-box.svg",
                            width: 150,
                            height: 150,
                          ),
                          Text(
                            "Không có giao dịch nào",
                            style: TextStyle(
                              fontSize: DeviceHelper.getFontSize(15),
                              color: AppColor.text1,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Chạm nút",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: DeviceHelper.getFontSize(14),
                                  color: AppColor.grey,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const Icon(Icons.add,
                                  color: AppColor.text1, size: 20),
                              Text(
                                "để thêm giao diện",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: DeviceHelper.getFontSize(14),
                                  color: AppColor.grey,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ).marginSymmetric(vertical: 10, horizontal: 20),
                        ],
                      ),
                    ),
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
                child: SvgPicture.asset(
                  controller.isPrevious.value
                      ? "assets/icons/previous.svg"
                      : "assets/icons/next.svg",
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

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColor.main,
          contentPadding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _itemTimeFillter(
                type: 'day',
                title: 'Ngày',
              ),
              _itemTimeFillter(
                type: 'month',
                title: 'Tháng',
              ),
              _itemTimeFillter(
                type: 'year',
                title: 'Năm',
              ),
              _itemTimeFillter(
                type: 'all',
                title: 'Tất cả',
              ),
              _itemTimeFillter(
                type: 'custom',
                title: 'Tùy chỉnh',
              ),
            ],
          ),
        );
      },
    );
  }

  GestureDetector _itemTimeFillter(
      {required String type, required String title}) {
    return GestureDetector(
      onTap: () {
        Get.back();
        controller.typeTime.value = type;
      },
      child: Row(
        children: [
          controller.typeTime.value == type
              ? Icon(
                  Icons.check,
                  color: AppColor.fourthMain,
                  size: 25,
                )
              : const SizedBox(
                  width: 25,
                  height: 25,
                ),
          const SizedBox(width: 20),
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
      ).paddingSymmetric(vertical: 8),
    );
  }
}
