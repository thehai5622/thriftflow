import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thriftflow/Controller/Individual/Setting/setting_controller.dart';
import 'package:thriftflow/Global/app_color.dart';
import 'package:thriftflow/Service/device_helper.dart';

class Setting extends StatelessWidget {
  Setting({super.key});

  final controller = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.main,
        elevation: 0,
        shadowColor: AppColor.text1,
        title: Text(
          "Cài đặt",
          style: TextStyle(
            fontSize: DeviceHelper.getFontSize(21),
            color: AppColor.text1,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Container(
        color: AppColor.subMain,
      ),
    );
  }
}
