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
          ).marginOnly(bottom: 10),
          _groupItem(
            icon: "assets/icons/group-drink.svg",
            title: "Uống",
          ).marginOnly(bottom: 10),
          _groupItem(
            icon: "assets/icons/group-shield.svg",
            title: "Bảo hiểm",
          ).marginOnly(bottom: 10),
          _groupItem(
            icon: "assets/icons/group-other.svg",
            title: "Chi phí khác",
          ).marginOnly(bottom: 10),
          _groupItem(
            icon: "assets/icons/group-invest.svg",
            title: "Đầu tư",
          ).marginOnly(bottom: 10),
          _groupItem(
            icon: "assets/icons/group-car.svg",
            title: "Di chuyển",
            children: [
              _groupItem(
                icon: "assets/icons/group-tool.svg",
                title: "Bảo dưỡng",
              ),
            ],
          ).marginOnly(bottom: 10),
          _groupItem(
            icon: "assets/icons/group-home.svg",
            title: "Gia đình",
            children: [
              _groupItem(
                icon: "assets/icons/group-home.svg",
                title: "Dịch vụ gia đình",
              ),
              _groupItem(
                icon: "assets/icons/group-tool.svg",
                title: "Sửa chữa & Trang trí nhà",
              ),
              _groupItem(
                icon: "assets/icons/group-dog-1.svg",
                title: "Chó",
              ),
              _groupItem(
                icon: "assets/icons/group-cat-1.svg",
                title: "Mèo",
              ),
            ],
          ).marginOnly(bottom: 10),
          _groupItem(
            icon: "assets/icons/group-game.svg",
            title: "Giải trí",
            children: [
              _groupItem(
                icon: "assets/icons/group-bank-card.svg",
                title: "Game online",
              ),
              _groupItem(
                icon: "assets/icons/group-game.svg",
                title: "Đi chơi",
              ),
            ],
          ).marginOnly(bottom: 10),
          _groupItem(
            icon: "assets/icons/group-education.svg",
            title: "Giáo dục",
          ).marginOnly(bottom: 10),
          _groupItem(
            icon: "assets/icons/group-bill.svg",
            title: "Hóa đơn",
            children: [
              _groupItem(
                icon: "assets/icons/group-electricity-bill.svg",
                title: "Hóa đơn điện",
              ),
              _groupItem(
                icon: "assets/icons/group-phone-bill.svg",
                title: "Hóa đơn điện thoại",
              ),
              _groupItem(
                icon: "assets/icons/group-gas-bill.svg",
                title: "Hóa đơn gas",
              ),
              _groupItem(
                icon: "assets/icons/group-internet-bill.svg",
                title: "Hóa đơn internet",
              ),
              _groupItem(
                icon: "assets/icons/group-water-bill.svg",
                title: "Hóa đơn nước",
              ),
              _groupItem(
                icon: "assets/icons/group-other-bill.svg",
                title: "Hóa đơn tiện ích khác",
              ),
              _groupItem(
                icon: "assets/icons/group-tv-bill.svg",
                title: "Hóa đơn TV",
              ),
              _groupItem(
                icon: "assets/icons/group-home-bill.svg",
                title: "Thuê nhà",
              ),
            ],
          ).marginOnly(bottom: 10),
          _groupItem(
            icon: "assets/icons/group-shopping.svg",
            title: "Mua sắm",
            children: [
              _groupItem(
                icon: "assets/icons/group-smartphone.svg",
                title: "Đồ dùng cá nhân",
              ),
              _groupItem(
                icon: "assets/icons/group-sofa.svg",
                title: "Đồ gia dụng",
              ),
              _groupItem(
                icon: "assets/icons/group-beautiful.svg",
                title: "Làm đẹp",
              ),
            ],
          ).marginOnly(bottom: 10),
          _groupItem(
            icon: "assets/icons/group-gift.svg",
            title: "Quà tặng & Quyên góp",
          ).marginOnly(bottom: 10),
          _groupItem(
            icon: "assets/icons/group-health.svg",
            title: "Sức khỏe",
            children: [
              _groupItem(
                icon: "assets/icons/group-stethoscope.svg",
                title: "Khám sức khỏe",
              ),
              _groupItem(
                icon: "assets/icons/group-volleyball.svg",
                title: "Thể dục thể thao",
              ),
            ],
          ).marginOnly(bottom: 10),
          _groupItem(
            icon: "assets/icons/group-transfer.svg",
            title: "Tiền chuyển đi",
          ).marginOnly(bottom: 10),
          _groupItem(
            icon: "assets/icons/group-interest-payment.svg",
            title: "Trả lãi",
          ).marginOnly(bottom: 10),
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
          ).marginOnly(bottom: 10),
          _groupItem(
            icon: "assets/icons/group-make-profit.svg",
            title: "Thu lãi",
          ).marginOnly(bottom: 10),
          _groupItem(
            icon: "assets/icons/group-achievements.svg",
            title: "Thu nhập khác",
          ).marginOnly(bottom: 10),
          _groupItem(
            icon: "assets/icons/group-transfer.svg",
            title: "Tiền chuyển đến",
          ).marginOnly(bottom: 10),
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
          ).marginOnly(bottom: 10),
          _groupItem(
            icon: "assets/icons/group-borrow.svg",
            title: "Đi vay",
          ).marginOnly(bottom: 10),
          _groupItem(
            icon: "assets/icons/group-debt-collection.svg",
            title: "Thu nợ",
          ).marginOnly(bottom: 10),
          _groupItem(
            icon: "assets/icons/group-debt-repayment.svg",
            title: "Trả nợ",
          ).marginOnly(bottom: 10),
          _requestSupport(),
        ],
      ),
    );
  }

  Column _groupItem({
    required String icon,
    required String title,
    void Function()? onTap,
    List<Widget> children = const [],
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            color: AppColor.main,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      icon,
                      height: 40,
                      width: 40,
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
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: children.length,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Row(
                  children: [
                    Container(
                      width: 20,
                      height: 56,
                      decoration: const BoxDecoration(
                        color: AppColor.main,
                      ),
                    ),
                    Expanded(child: children[index]),
                  ],
                ),
                Positioned(
                  top: 0,
                  left: 20,
                  child: Container(
                    width: 1,
                    height: children.length - 1 == index ? 28 : 56,
                    color: AppColor.fourthMain,
                  ),
                ),
                Positioned(
                  top: 28,
                  left: 20,
                  child: Container(
                    width: 17,
                    height: 1,
                    color: AppColor.fourthMain,
                  ),
                ),
              ],
            );
          },
        )
      ],
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
                  color: AppColor.thirdMain,
                  fontWeight: FontWeight.w500,
                )),
            const SizedBox(width: 5),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.white,
                  border: Border.all(
                    width: 1,
                    color: AppColor.thirdMain,
                  )),
              child: Text("?",
                  style: TextStyle(
                    fontSize: DeviceHelper.getFontSize(12),
                    color: AppColor.thirdMain,
                    fontWeight: FontWeight.w900,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
