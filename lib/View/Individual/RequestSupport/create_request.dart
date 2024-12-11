import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thriftflow/Controller/Individual/RequestSupport/create_request_controller.dart';
import 'package:thriftflow/Global/app_color.dart';
import 'package:thriftflow/Service/device_helper.dart';

class CreateRequest extends StatelessWidget {
  CreateRequest({super.key});

  final controller = Get.put(CreateRequestController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: AppColor.main,
        foregroundColor: AppColor.text1,
        elevation: 0.5,
        shadowColor: AppColor.text1,
        title: Text(
          "Tạo yêu cầu",
          style: TextStyle(
            fontSize: DeviceHelper.getFontSize(21),
            color: AppColor.text1,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Container(
        color: AppColor.main,
      ),
    );
  }
}
