import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
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
        scrolledUnderElevation: 0.0,
        backgroundColor: AppColor.main,
        elevation: 0,
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
        decoration: const BoxDecoration(
          color: AppColor.subMain,
        ),
        child: ListView(
          children: [
            Text(
              "Phiên bản 1.0.0",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: DeviceHelper.getFontSize(15),
                color: AppColor.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
