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
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Icon(Icons.replay, color: AppColor.grey, size: 25),
              ],
            ).marginSymmetric(horizontal: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              margin: const EdgeInsets.symmetric(vertical: 10),
              color: AppColor.main,
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/android.svg",
                    height: 30,
                    width: 30,
                    colorFilter: const ColorFilter.mode(
                      AppColor.grey,
                      BlendMode.srcIn,
                    ),
                  )
                ],
              ),
            ),
            Text(
              "Tài khoản",
              style: TextStyle(
                fontSize: DeviceHelper.getFontSize(14),
                color: AppColor.grey,
                fontWeight: FontWeight.w500,
              ),
            ).marginSymmetric(horizontal: 20),
          ],
        ),
      ),
    );
  }
}
