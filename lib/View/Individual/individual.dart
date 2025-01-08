import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:thriftflow/Component/personal_info.dart';
import 'package:thriftflow/Controller/Individual/individual_controller.dart';
import 'package:thriftflow/Global/app_color.dart';
import 'package:thriftflow/Route/app_page.dart';
import 'package:thriftflow/Service/device_helper.dart';

class Individual extends StatelessWidget {
  Individual({super.key});

  final controller = Get.put(IndividualController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.main,
        elevation: 0,
        shadowColor: AppColor.text1,
        title: Text(
          "Tài khoản",
          style: TextStyle(
            fontSize: DeviceHelper.getFontSize(21),
            color: AppColor.text1,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.requestSupport);
            },
            child: Row(
              children: [
                Text(
                  "Hỗ trợ",
                  style: TextStyle(
                    fontSize: DeviceHelper.getFontSize(16),
                    color: AppColor.text1,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(width: 8),
                SvgPicture.asset(
                  'assets/icons/question-square.svg',
                  height: 25,
                  width: 25,
                ),
              ],
            ).marginOnly(right: 16),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: AppColor.subMain,
        ),
        child: ListView(
          children: [
            PersonalInfo(
              acronym: "L",
              name: "Luonghai5622",
              email: "luonghai5622@gmail.com",
              onTap: () => Get.toNamed(Routes.accountManagement),
            ).marginSymmetric(vertical: 20),
            _utilitiesItem(
                icon: "assets/icons/ultils-wallet.svg",
                title: "Ví của tôi",
                onTap: () => Get.toNamed(Routes.myWallet)),
            _utilitiesItem(
              icon: "assets/icons/ultils-group.svg",
              title: "Nhóm",
              onTap: () => Get.toNamed(Routes.group),
            ),
            _utilitiesItem(
              icon: "assets/icons/ultils-event.svg",
              title: "Sự kiện",
              onTap: () => Get.toNamed(Routes.event),
            ),
            _utilitiesItem(
              icon: "assets/icons/ultils-periodic.svg",
              title: "Giao dịch định kì",
              onTap: () => Get.toNamed(Routes.periodic),
            ),
            _utilitiesItem(
              icon: "assets/icons/ultils-bill.svg",
              title: "Hóa đơn",
              onTap: () => Get.toNamed(Routes.bill),
            ),
            _utilitiesItem(
              icon: "assets/icons/ultils-debt-book.svg",
              title: "Sổ nợ",
              onTap: () => Get.toNamed(Routes.debtBook),
            ),
            _utilitiesItem(
              icon: "assets/icons/ultils-tool.svg",
              title: "Công cụ",
              onTap: () => Get.toNamed(Routes.tool),
            ),
            _utilitiesItem(
              icon: "assets/icons/ultils-travel.svg",
              title: "Chế độ sự kiện",
              onTap: () => _showDialog(context),
            ),
            _utilitiesItem(
              icon: "assets/icons/ultils-question.svg",
              title: "Hỗ trợ",
              onTap: () => Get.toNamed(Routes.help),
            ),
            _utilitiesItem(
              icon: "assets/icons/ultils-setting.svg",
              title: "Cài đặt",
              onTap: () => Get.toNamed(Routes.setting),
            ),
            _utilitiesItem(
              icon: "assets/icons/ultils-information.svg",
              title: "Giới thiệu",
              onTap: () => Get.toNamed(Routes.introduce),
            ),
            Text(
              "Phiên bản 1.0.0",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: DeviceHelper.getFontSize(16),
                color: AppColor.grey,
                fontWeight: FontWeight.w400,
              ),
            ).marginOnly(top: 20),
          ],
        ).paddingOnly(bottom: 50),
      ),
    );
  }

  GestureDetector _utilitiesItem({
    required String icon,
    required String title,
    void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColor.main,
          border: Border(
            bottom: BorderSide(
              color: AppColor.subMain,
              width: 1,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
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
                Text(
                  title,
                  style: TextStyle(
                    fontSize: DeviceHelper.getFontSize(14),
                    color: AppColor.text1,
                    fontWeight: FontWeight.w500,
                  ),
                ),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Chế độ sự kiện",
                style: TextStyle(
                  fontSize: DeviceHelper.getFontSize(20),
                  color: AppColor.text1,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Trong chế độ sự kiện, bạn có thể chọn một sự kiện đang xảy ra làm sự kiện mặc định khi tạo mới giao dịch.",
                style: TextStyle(
                  fontSize: DeviceHelper.getFontSize(14),
                  color: AppColor.grey,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Chọn sự kiện",
                    style: TextStyle(
                      fontSize: DeviceHelper.getFontSize(18),
                      color: AppColor.text1,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add,
                      size: 25,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Text(
                    "ĐÓNG",
                    style: TextStyle(
                      fontSize: DeviceHelper.getFontSize(15),
                      color: AppColor.thirdMain,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
