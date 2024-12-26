import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:thriftflow/Controller/Individual/Group/group_controller.dart';
import 'package:thriftflow/Global/app_color.dart';
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
                children: const [
                  Center(child: Text("Khoản chi")),
                  Center(child: Text("Khoản thu")),
                  Center(child: Text("Vay/Nợ")),
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
}
