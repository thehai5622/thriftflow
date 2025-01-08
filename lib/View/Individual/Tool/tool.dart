import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:thriftflow/Controller/Individual/Tool/tool_controller.dart';
import 'package:thriftflow/Global/app_color.dart';
import 'package:thriftflow/Service/device_helper.dart';

class Tool extends StatelessWidget {
  Tool({super.key});

  final controller = Get.put(ToolController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.main,
        elevation: 0,
        shadowColor: AppColor.text1,
        title: Text(
          "Công cụ",
          style: TextStyle(
            fontSize: DeviceHelper.getFontSize(21),
            color: AppColor.text1,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: AppColor.subMain,
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 10),
          children: [
            _toolItem(
              icon: "assets/icons/tool-csv.svg",
              title: "Xuất file CSV",
            ),
            _toolItem(
              icon: "assets/icons/tool-excel.svg",
              title: "Xuất dữ liệu tới Google Trang tính",
              isEnded: true,
            ),
            _toolItem(
              icon: "assets/icons/tool-bank.svg",
              title: "Tìm ngân hàng",
            ),
            _toolItem(
              icon: "assets/icons/tool-calculator.svg",
              title: "Tính thuế thu nhập cá nhân",
            ),
            _toolItem(
              icon: "assets/icons/tool-percent.svg",
              title: "Lãi suất",
              isEnded: true,
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector _toolItem({
    required String icon,
    required String title,
    bool isEnded = false,
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
              width: isEnded ? 2 : 0,
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
}
