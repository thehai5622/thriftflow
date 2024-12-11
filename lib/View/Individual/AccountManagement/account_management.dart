import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:thriftflow/Component/personal_info.dart';
import 'package:thriftflow/Controller/Individual/AccountManagement/account_management_controller.dart';
import 'package:thriftflow/Global/app_color.dart';
import 'package:thriftflow/Service/device_helper.dart';

class AccountManagement extends StatelessWidget {
  AccountManagement({super.key});

  final controller = Get.put(AccountManagementController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.main,
        foregroundColor: AppColor.text1,
        elevation: 0,
        shadowColor: AppColor.text1,
        title: Text(
          "Quản lý tài khoản",
          style: TextStyle(
            fontSize: DeviceHelper.getFontSize(21),
            color: AppColor.text1,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Container(
        color: AppColor.subMain,
        child: ListView(
          children: [
            const PersonalInfo(
              acronym: "L",
              name: "Luonghai5622",
              email: "luonghai5622@gmail.com",
              isExpendPadding: false,
            ).marginSymmetric(vertical: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Thiết bị (1/5)",
                  style: TextStyle(
                    fontSize: DeviceHelper.getFontSize(14),
                    color: AppColor.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Icon(Icons.replay, color: AppColor.text2, size: 25),
              ],
            ).paddingSymmetric(horizontal: 20).marginOnly(bottom: 10),
            _utilsItem(
              icon: "assets/icons/android.svg",
              title: "Redmi Note 8 Pro",
              subtitle: "Thiết bị này",
            ),
            Text(
              "Tài khoản",
              style: TextStyle(
                fontSize: DeviceHelper.getFontSize(14),
                color: AppColor.grey,
                fontWeight: FontWeight.w400,
              ),
            ).paddingSymmetric(horizontal: 20).marginSymmetric(vertical: 10),
            _utilsItem(
              icon: "assets/icons/ultils-replay.svg",
              title: "Thay đổi mật khẩu",
              onTap: () {},
            ),
            _utilsItem(
              icon: "assets/icons/ultils-trash.svg",
              title: "Xóa tài khoản",
              onTap: () {},
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.main,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(26),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 70),
              ),
              onPressed: () {
                // Logout
              },
              child: Text(
                "Đăng xuất",
                style: TextStyle(
                  fontSize: DeviceHelper.getFontSize(14),
                  color: AppColor.fourthMain,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ).marginSymmetric(horizontal: 15, vertical: 10),
          ],
        ),
      ),
    );
  }

  GestureDetector _utilsItem({
    required String icon,
    required String title,
    String? subtitle,
    void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        color: AppColor.main,
        child: Row(
          mainAxisAlignment: onTap != null
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  icon,
                  height: 30,
                  width: 30,
                  colorFilter: const ColorFilter.mode(
                    AppColor.grey,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: DeviceHelper.getFontSize(14),
                        color: AppColor.text1,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    if (subtitle != null)
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: DeviceHelper.getFontSize(13),
                          color: AppColor.text1,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                  ],
                ),
              ],
            ),
            if (onTap != null) const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 17,
              color: AppColor.grey,
            ),
          ],
        ),
      ),
    );
  }
}
