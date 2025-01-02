import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thriftflow/Controller/Individual/Help/help_controller.dart';
import 'package:thriftflow/Global/app_color.dart';
import 'package:thriftflow/Route/app_page.dart';
import 'package:thriftflow/Service/device_helper.dart';

class Help extends StatelessWidget {
  Help({super.key});

  final controller = Get.put(HelpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.main,
        elevation: 0,
        shadowColor: AppColor.text1,
        title: Text(
          "Hỗ trợ",
          style: TextStyle(
            fontSize: DeviceHelper.getFontSize(21),
            color: AppColor.text1,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: AppColor.subMain,
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 10),
          children: [
            _helpItem(
              title: "Yêu cầu hỗ trợ",
              onTap: () => Get.toNamed(Routes.requestSupport),
            ),
            _helpItem(
              title: "Báo lỗi đến nhà phát triển",
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector _helpItem({
    required String title,
    void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: const BoxDecoration(
          color: AppColor.main,
          border: Border(
            bottom: BorderSide(
              color: AppColor.subMain,
              width: 1,
            ),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: DeviceHelper.getFontSize(14),
            color: AppColor.text1,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
