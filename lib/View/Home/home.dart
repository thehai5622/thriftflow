import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:thriftflow/Component/tooltip.dart';
import 'package:thriftflow/Controller/Home/home_controller.dart';
import 'package:thriftflow/Global/app_color.dart';
import 'package:thriftflow/Route/app_page.dart';
import 'package:thriftflow/Service/device_helper.dart';
import 'package:thriftflow/Utils/wallet_utils.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // scrolledUnderElevation: 0.0,
        backgroundColor: AppColor.main,
        elevation: 0,
        shadowColor: AppColor.text1,
        title: Column(children: [
          Row(
            children: [
              Obx(
                () => controller.isShowBalance.value
                    ? Row(
                        children: [
                          Text(
                            "15,000",
                            style: TextStyle(
                              fontSize: DeviceHelper.getFontSize(22),
                              color: AppColor.text1,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "đ",
                            style: TextStyle(
                              fontSize: DeviceHelper.getFontSize(22),
                              color: AppColor.text1,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      )
                    : Text(
                        "✱✱✱✱✱✱✱",
                        style: TextStyle(
                          fontSize: DeviceHelper.getFontSize(22),
                          color: AppColor.text1,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
              ),
              GestureDetector(
                onTap: () {
                  controller.changeShowBalance();
                },
                child: Obx(
                  () => Icon(
                          controller.isShowBalance.value
                              ? Icons.remove_red_eye
                              : Icons.remove_red_eye_outlined,
                          color: AppColor.text1)
                      .marginOnly(left: 12),
                ),
              ),
            ],
          ),
          MyTooltip(
              message: "Được tính dựa trên số dư của các ví nằm trong tổng",
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Tổng số dư",
                    style: TextStyle(
                      fontSize: DeviceHelper.getFontSize(12),
                      color: AppColor.text3,
                      fontWeight: FontWeight.w400,
                    ),
                  ).marginOnly(right: 4),
                  Container(
                    height: 14,
                    width: 14,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.text3,
                    ),
                    child: const Icon(
                      Icons.question_mark,
                      color: Colors.white,
                      size: 10,
                    ),
                  )
                ],
              )),
        ]),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.notification);
            },
            icon: const Icon(
              Icons.notifications_rounded,
              color: AppColor.text1,
            ),
            tooltip: 'Thông báo',
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: AppColor.subMain,
        ),
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: AppColor.main,
                  borderRadius: BorderRadius.circular(16)),
              child: Column(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Ví của tôi",
                        style: TextStyle(
                          fontSize: DeviceHelper.getFontSize(14),
                          color: AppColor.text1,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.walletOverview);
                        },
                        child: Text(
                          "Xem tất cả",
                          style: TextStyle(
                            fontSize: DeviceHelper.getFontSize(12),
                            color: AppColor.fourthMain,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ]).marginSymmetric(horizontal: 16, vertical: 12),
                _myWalletItem(
                  type: WalletUtils.WALLET_BASE,
                  name: "Tiền mặt",
                  amount: "15,000",
                  acronym: "đ",
                ),
                _myWalletItem(
                  type: WalletUtils.WALLET_CREDIT_CARD,
                  name: "Thẻ tín dụng",
                  amount: "0",
                  acronym: "đ",
                ),
              ]),
            ).marginSymmetric(horizontal: 20, vertical: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Báo cáo tháng này",
                  style: TextStyle(
                    fontSize: DeviceHelper.getFontSize(12),
                    color: AppColor.grey,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "Xem báo cáo",
                  style: TextStyle(
                    fontSize: DeviceHelper.getFontSize(12),
                    color: AppColor.fourthMain,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ).paddingSymmetric(horizontal: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                  color: AppColor.main,
                  borderRadius: BorderRadius.circular(16)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(
                      () => Column(
                        children: controller.reportTabIndex.value == 0
                            ? [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Obx(
                                        () => GestureDetector(
                                          onTap: () {
                                            controller
                                                .reportTrendTabIndex.value = 0;
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.only(
                                                bottom: 6),
                                            decoration: BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: controller
                                                              .reportTrendTabIndex
                                                              .value ==
                                                          0
                                                      ? AppColor.fourthMain
                                                      : AppColor.subMain,
                                                  width: 2,
                                                ),
                                              ),
                                            ),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Tổng đã chi",
                                                    style: TextStyle(
                                                      fontSize: DeviceHelper
                                                          .getFontSize(13),
                                                      color: AppColor.grey,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  Text(
                                                    "0",
                                                    style: TextStyle(
                                                      fontSize: DeviceHelper
                                                          .getFontSize(14),
                                                      color:
                                                          AppColor.fourthMain,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ]),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Obx(
                                        () => GestureDetector(
                                          onTap: () {
                                            controller
                                                .reportTrendTabIndex.value = 1;
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.only(
                                                bottom: 6),
                                            decoration: BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: controller
                                                              .reportTrendTabIndex
                                                              .value ==
                                                          1
                                                      ? AppColor.purple
                                                      : AppColor.subMain,
                                                  width: 2,
                                                ),
                                              ),
                                            ),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Tổng thu",
                                                    style: TextStyle(
                                                      fontSize: DeviceHelper
                                                          .getFontSize(13),
                                                      color: AppColor.grey,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  Text(
                                                    "0",
                                                    style: TextStyle(
                                                      fontSize: DeviceHelper
                                                          .getFontSize(14),
                                                      color: AppColor.purple,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ]),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 13,
                                      width: 13,
                                      decoration: const BoxDecoration(
                                        color: AppColor.fourthMain,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      "Tháng này",
                                      style: TextStyle(
                                        fontSize: DeviceHelper.getFontSize(11),
                                        color: AppColor.grey,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(width: 30),
                                    Container(
                                      height: 13,
                                      width: 13,
                                      decoration: const BoxDecoration(
                                        color: AppColor.subMain,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      "Trung bình 3 tháng trước",
                                      style: TextStyle(
                                        fontSize: DeviceHelper.getFontSize(11),
                                        color: AppColor.grey,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Container(
                                      height: 14,
                                      width: 14,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColor.text3,
                                      ),
                                      child: const Icon(
                                        Icons.question_mark,
                                        color: Colors.white,
                                        size: 10,
                                      ),
                                    ),
                                  ],
                                ).marginSymmetric(horizontal: 16, vertical: 6),
                                Text(
                                  "Nhập giao dịch để xem báo cáo",
                                  style: TextStyle(
                                    fontSize: DeviceHelper.getFontSize(13),
                                    color: AppColor.grey,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ).marginSymmetric(horizontal: 16, vertical: 40),
                              ]
                            : [
                                Container(
                                  padding: const EdgeInsets.all(2.5),
                                  decoration: BoxDecoration(
                                    color: AppColor.subMain,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: GestureDetector(
                                        onTap: () {
                                          controller
                                              .reportExpenseTabIndex.value = 0;
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            color: controller
                                                        .reportExpenseTabIndex
                                                        .value ==
                                                    0
                                                ? AppColor.main
                                                : AppColor.subMain,
                                          ),
                                          child: Text(
                                            "Tuần",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize:
                                                  DeviceHelper.getFontSize(13),
                                              color: controller
                                                          .reportExpenseTabIndex
                                                          .value ==
                                                      0
                                                  ? AppColor.text1
                                                  : AppColor.grey,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      )),
                                      Expanded(
                                          child: GestureDetector(
                                        onTap: () {
                                          controller
                                              .reportExpenseTabIndex.value = 1;
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            color: controller
                                                        .reportExpenseTabIndex
                                                        .value ==
                                                    1
                                                ? AppColor.main
                                                : AppColor.subMain,
                                          ),
                                          child: Text(
                                            "Tháng",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize:
                                                  DeviceHelper.getFontSize(13),
                                              color: controller
                                                          .reportExpenseTabIndex
                                                          .value ==
                                                      1
                                                  ? AppColor.text1
                                                  : AppColor.grey,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      )),
                                    ],
                                  ),
                                ).marginOnly(bottom: 6),
                                Row(
                                  children: [
                                    Text(
                                      "0",
                                      style: TextStyle(
                                        fontSize: DeviceHelper.getFontSize(20),
                                        color: AppColor.text1,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      "đ",
                                      style: TextStyle(
                                        fontSize: DeviceHelper.getFontSize(20),
                                        color: AppColor.text1,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Tổng chi ${controller.reportExpenseTabIndex.value == 0 ? "tuần" : "tháng"} này",
                                      style: TextStyle(
                                        fontSize: DeviceHelper.getFontSize(11),
                                        color: AppColor.grey,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Container(
                                        height: 14,
                                        width: 14,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColor.subMain,
                                        ),
                                        child: SvgPicture.asset(
                                          'assets/icons/minus.svg',
                                          colorFilter: const ColorFilter.mode(
                                              AppColor.purple, BlendMode.srcIn),
                                          height: 12,
                                          width: 12,
                                        )),
                                    const SizedBox(width: 6),
                                    Text(
                                      "0%",
                                      style: TextStyle(
                                        fontSize: DeviceHelper.getFontSize(16),
                                        color: AppColor.orange,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "Nhập giao dịch để xem báo cáo",
                                  style: TextStyle(
                                    fontSize: DeviceHelper.getFontSize(13),
                                    color: AppColor.grey,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ).marginSymmetric(horizontal: 16, vertical: 40),
                              ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.changeReportTabIndex();
                          },
                          child: const Icon(Icons.arrow_back_ios,
                                  size: 20, color: AppColor.fourthMain)
                              .marginOnly(left: 20),
                        ),
                        Obx(
                          () => Text(
                            controller.reportTabIndex.value == 0
                                ? "Báo cáo xu hướng"
                                : "Báo cáo chi tiêu",
                            style: TextStyle(
                              fontSize: DeviceHelper.getFontSize(15),
                              color: AppColor.fourthMain,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.changeReportTabIndex();
                          },
                          child: const Icon(Icons.arrow_forward_ios,
                                  size: 20, color: AppColor.fourthMain)
                              .marginOnly(right: 20),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(
                          () => Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                              color: controller.reportTabIndex.value == 0
                                  ? AppColor.grey
                                  : AppColor.subMain,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Obx(
                          () => Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                              color: controller.reportTabIndex.value == 1
                                  ? AppColor.grey
                                  : AppColor.subMain,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ).marginOnly(top: 4),
                  ]),
            ).marginSymmetric(horizontal: 20, vertical: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Chi tiêu nhiều nhất",
                  style: TextStyle(
                    fontSize: DeviceHelper.getFontSize(12),
                    color: AppColor.grey,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "Xem chi tiết",
                  style: TextStyle(
                    fontSize: DeviceHelper.getFontSize(12),
                    color: AppColor.fourthMain,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ).paddingSymmetric(horizontal: 20, vertical: 6),
            Container(
              margin: const EdgeInsets.only(bottom: 6),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: AppColor.main,
                  borderRadius: BorderRadius.circular(16)),
              child: Column(children: [
                Container(
                  padding: const EdgeInsets.all(2.5),
                  decoration: BoxDecoration(
                    color: AppColor.subMain,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Obx(
                    () => Row(
                      children: [
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            controller.spendingDetailsTabIndex.value = 0;
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color:
                                  controller.spendingDetailsTabIndex.value == 0
                                      ? AppColor.main
                                      : AppColor.subMain,
                            ),
                            child: Text(
                              "Tuần",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: DeviceHelper.getFontSize(13),
                                color:
                                    controller.spendingDetailsTabIndex.value ==
                                            0
                                        ? AppColor.text1
                                        : AppColor.grey,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        )),
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            controller.spendingDetailsTabIndex.value = 1;
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color:
                                  controller.spendingDetailsTabIndex.value == 1
                                      ? AppColor.main
                                      : AppColor.subMain,
                            ),
                            child: Text(
                              "Tháng",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: DeviceHelper.getFontSize(13),
                                color:
                                    controller.spendingDetailsTabIndex.value ==
                                            1
                                        ? AppColor.text1
                                        : AppColor.grey,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                ).marginSymmetric(vertical: 12),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColor.thirdMain),
                    child: Text(
                      "Ví dụ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: DeviceHelper.getFontSize(13),
                        color: AppColor.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ]),
            ).marginSymmetric(horizontal: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Giao dịch gần đây",
                  style: TextStyle(
                    fontSize: DeviceHelper.getFontSize(12),
                    color: AppColor.grey,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "Xem tất cả",
                  style: TextStyle(
                    fontSize: DeviceHelper.getFontSize(12),
                    color: AppColor.fourthMain,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ).paddingSymmetric(horizontal: 20, vertical: 6),
            Container(
              margin: const EdgeInsets.only(bottom: 50),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: AppColor.main,
                  borderRadius: BorderRadius.circular(16)),
              child: Center(
                child: Text(
                  "Giao dịch đã thêm sẽ hiển thị ở đây",
                  style: TextStyle(
                    fontSize: DeviceHelper.getFontSize(13),
                    color: AppColor.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ).marginSymmetric(vertical: 30),
              ),
            ).marginSymmetric(horizontal: 20),
          ],
        ),
      ),
    );
  }

  GestureDetector _myWalletItem({
    required int type,
    required String name,
    required String amount,
    required String acronym,
    void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: AppColor.subMain,
              width: 1,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  WalletUtils.getIconWalletByType(type),
                  height: 40,
                  width: 40,
                ).marginOnly(right: 12),
                Text(
                  name,
                  style: TextStyle(
                    fontSize: DeviceHelper.getFontSize(12),
                    color: AppColor.text1,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  amount,
                  style: TextStyle(
                    fontSize: DeviceHelper.getFontSize(12),
                    color: AppColor.text1,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  acronym,
                  style: TextStyle(
                    fontSize: DeviceHelper.getFontSize(12),
                    color: AppColor.text1,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
