import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:thriftflow/Controller/Individual/Introduce/Introduce_controller.dart';
import 'package:thriftflow/Global/app_color.dart';
import 'package:thriftflow/Service/device_helper.dart';

class Introduce extends StatelessWidget {
  Introduce({super.key});

  final controller = Get.put(IntroduceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.main,
        elevation: 0,
        shadowColor: AppColor.text1,
        title: Text(
          "Giới thiệu",
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
          padding: const EdgeInsets.symmetric(vertical: 20),
          children: [
            SvgPicture.asset(
              "assets/icons/logo.svg",
              width: 150,
              height: 150,
            ),
            Text(
              "Thrift Flow",
              textAlign: TextAlign.center,
              style: TextStyle(
                letterSpacing: 3,
                fontSize: DeviceHelper.getFontSize(21),
                color: AppColor.text1,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              "Phiên bản 1.0.0",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: DeviceHelper.getFontSize(16),
                color: AppColor.grey,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              "từ Thế Hải",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: DeviceHelper.getFontSize(17),
                color: AppColor.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              color: AppColor.main,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 16),
                          decoration: const BoxDecoration(
                              border: Border(
                                  right: BorderSide(
                                      color: AppColor.subMain, width: 1))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/introduce-book.svg",
                                height: 50,
                                width: 50,
                              ),
                              const SizedBox(height: 6),
                              Text(
                                "Hướng dẫn",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: DeviceHelper.getFontSize(17),
                                  color: AppColor.text1,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 16),
                          decoration: const BoxDecoration(
                              border: Border(
                                  left: BorderSide(
                                      color: AppColor.subMain, width: 1))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/introduce-question.svg",
                                height: 50,
                                width: 50,
                              ),
                              const SizedBox(height: 6),
                              Text(
                                "Hỗ trợ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: DeviceHelper.getFontSize(17),
                                  color: AppColor.text1,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  _introduceItem(
                    icon: "assets/icons/introduce-facebook.svg",
                    title: "Theo dõi tôi trên Facebook",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 6),
            Container(
              color: AppColor.main,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Text(
                "Presented by Thế Hải",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: DeviceHelper.getFontSize(14),
                  color: AppColor.text1,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector _introduceItem({
    required String icon,
    required String title,
    void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SvgPicture.asset(
            icon,
            height: 45,
            width: 45,
          ),
          const SizedBox(width: 20),
          SizedBox(
            width: Get.width * 0.4,
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: DeviceHelper.getFontSize(15),
                color: AppColor.text1,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ).marginSymmetric(vertical: 12),
    );
  }
}
