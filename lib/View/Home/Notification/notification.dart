import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:thriftflow/Controller/Home/Notification/notification_controller.dart';
import 'package:thriftflow/Global/app_color.dart';
import 'package:thriftflow/Service/device_helper.dart';

class Notification extends StatelessWidget {
  Notification({super.key});

  final controller = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.main,
          foregroundColor: AppColor.text1,
          elevation: 0.5,
          shadowColor: AppColor.text1,
          title: Text(
            "Thông báo",
            style: TextStyle(
              fontSize: DeviceHelper.getFontSize(21),
              color: AppColor.text1,
              fontWeight: FontWeight.w700,
            ),
          ),
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.close,
              color: AppColor.text1,
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                // Read all
              },
              child: SvgPicture.asset(
                "assets/icons/clear-all.svg",
                height: 30,
                width: 30,
                colorFilter: const ColorFilter.mode(
                  AppColor.text1,
                  BlendMode.srcIn,
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
        body: Container(
          color: AppColor.subMain,
        ));
  }
}
