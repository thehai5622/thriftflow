import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:thriftflow/Controller/Individual/Group/group_controller.dart';
import 'package:thriftflow/Global/app_color.dart';
import 'package:thriftflow/Global/app_group.dart';
import 'package:thriftflow/Route/app_page.dart';
import 'package:thriftflow/Service/device_helper.dart';

class Group extends StatelessWidget {
  Group({super.key});

  final controller = Get.put(GroupController());
  final widthScreen = Get.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.main,
        foregroundColor: AppColor.text1,
        elevation: 0,
        scrolledUnderElevation: 0,
        shadowColor: AppColor.text1,
        title: Text(
          "Nhóm",
          style: TextStyle(
            fontSize: DeviceHelper.getFontSize(21),
            color: AppColor.text1,
            fontWeight: FontWeight.w700,
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
          GestureDetector(
              onTap: () {
                // Search
              },
              child: SvgPicture.asset(
                "assets/icons/search.svg",
                height: 25,
                width: 25,
                colorFilter: const ColorFilter.mode(
                  AppColor.text1,
                  BlendMode.srcIn,
                ),
              )),
          const SizedBox(width: 12),
        ],
      ),
      body: Container(
        color: AppColor.subMain,
        child: Column(
          children: [
            Container(
              color: AppColor.main,
              child: TabBar(
                unselectedLabelColor: AppColor.grey,
                labelColor: AppColor.text1,
                dividerColor: AppColor.subMain,
                isScrollable: true,
                indicatorColor: AppColor.text1,
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                tabs: [
                  SizedBox(
                    width: widthScreen / 4,
                    child: const Tab(
                      child: Text("Khoản chi"),
                    ),
                  ),
                  SizedBox(
                    width: widthScreen / 4,
                    child: const Tab(
                      child: Text("Khoản thu"),
                    ),
                  ),
                  SizedBox(
                    width: widthScreen / 4,
                    child: const Tab(
                      child: Text("Vay/Nợ"),
                    ),
                  ),
                ],
                controller: controller.tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                tabAlignment: TabAlignment.center,
                labelStyle: TextStyle(
                  fontSize: DeviceHelper.getFontSize(14),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: controller.tabController,
                children: [
                  _expenses(),
                  _revenue(),
                  _debt(),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                controller.changeShowExtendGroup();
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: AppColor.main,
                ),
                child: Obx(
                  () => Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        controller.isShowInactiveGroup.value
                            ? Icons.remove
                            : Icons.add,
                        size: 25,
                        color: AppColor.fourthMain,
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          controller.isShowInactiveGroup.value
                              ? "Ẩn nhóm không hoạt động"
                              : "Hiển thị nhóm không hoạt động",
                          style: TextStyle(
                            fontSize: DeviceHelper.getFontSize(16),
                            color: AppColor.fourthMain,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView _expenses() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _createNewGroup(type: AppGroup.EXPENSES),
          _groupItem(
            icon: "assets/icons/group-eat.svg",
            title: "Ăn",
          ),
          _groupItem(
            icon: "assets/icons/group-drink.svg",
            title: "Uống",
          ),
          _groupItem(
            icon: "assets/icons/group-shield.svg",
            title: "Bảo vệ",
          ),
          _groupItem(
            icon: "assets/icons/group-other.svg",
            title: "Khác",
          ),
          _groupItem(
            icon: "assets/icons/group-invest.svg",
            title: "Đầu tư",
          ),
          _groupItem(
            icon: "assets/icons/group-car.svg",
            title: "Di chuyển",
          ),
          _groupItem(
            icon: "assets/icons/group-home.svg",
            title: "Gia đình",
          ),
          _groupItem(
            icon: "assets/icons/group-game.svg",
            title: "Giải trí",
          ),
          _groupItem(
            icon: "assets/icons/group-shopping.svg",
            title: "Mua sắm",
          ),
          _groupItem(
            icon: "assets/icons/group-gift.svg",
            title: "Quà tặng & Quyên góp",
          ),
          _groupItem(
            icon: "assets/icons/group-health.svg",
            title: "Sức khỏe",
          ),
          _groupItem(
            icon: "assets/icons/group-transfer.svg",
            title: "Tiền chuyển đi",
          ),
          _groupItem(
            icon: "assets/icons/group-interest-payment.svg",
            title: "Trả lãi",
          ),
          _requestSupport(),
        ],
      ),
    );
  }

  SingleChildScrollView _revenue() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _createNewGroup(type: AppGroup.REVENUE),
          _groupItem(
            icon: "assets/icons/group-wage.svg",
            title: "Lương",
          ),
          _groupItem(
            icon: "assets/icons/group-make-profit.svg",
            title: "Thu lãi",
          ),
          _groupItem(
            icon: "assets/icons/group-achievements.svg",
            title: "Thu nhập khác",
          ),
          _groupItem(
            icon: "assets/icons/group-transfer.svg",
            title: "Tiền chuyển đến",
          ),
          _requestSupport(),
        ],
      ),
    );
  }

  SingleChildScrollView _debt() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _groupItem(
            icon: "assets/icons/group-loan.svg",
            title: "Cho vay",
          ),
          _groupItem(
            icon: "assets/icons/group-borrow.svg",
            title: "Đi vay",
          ),
          _groupItem(
            icon: "assets/icons/group-debt-collection.svg",
            title: "Thu nợ",
          ),
          _groupItem(
            icon: "assets/icons/group-debt-repayment.svg",
            title: "Trả nợ",
          ),
          _requestSupport(),
        ],
      ),
    );
  }

  GestureDetector _groupItem({
    required String icon,
    required String title,
    void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: AppColor.main,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        margin: const EdgeInsets.only(bottom: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  icon,
                  height: 35,
                  width: 35,
                ),
                const SizedBox(width: 20),
                Text(title,
                    style: TextStyle(
                      fontSize: DeviceHelper.getFontSize(14),
                      color: AppColor.text1,
                      fontWeight: FontWeight.w500,
                    )),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 17,
              color: AppColor.grey,
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector _createNewGroup(
      {required String type, void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: AppColor.main,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        margin: const EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.fourthMain,
              ),
              child: const Icon(
                Icons.add,
                size: 16,
                color: AppColor.white,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
                child: Text("NHÓM MỚI",
                    style: TextStyle(
                      fontSize: DeviceHelper.getFontSize(15),
                      color: AppColor.fourthMain,
                      fontWeight: FontWeight.w500,
                    ))),
          ],
        ),
      ),
    );
  }

  GestureDetector _requestSupport() {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.requestSupport),
      child: Container(
        color: AppColor.main,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        margin: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Bạn có thắc mắc",
                style: TextStyle(
                  fontSize: DeviceHelper.getFontSize(15),
                  color: AppColor.fourthMain,
                  fontWeight: FontWeight.w400,
                )),
            const SizedBox(width: 5),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.white,
                  border: Border.all(
                    width: 1,
                    color: AppColor.fourthMain,
                  )),
              child: Text("?",
                  style: TextStyle(
                    fontSize: DeviceHelper.getFontSize(12),
                    color: AppColor.fourthMain,
                    fontWeight: FontWeight.w900,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
