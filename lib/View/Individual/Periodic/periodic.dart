import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:thriftflow/Controller/Individual/Periodic/periodic_controller.dart';
import 'package:thriftflow/Global/app_color.dart';
import 'package:thriftflow/Route/app_page.dart';
import 'package:thriftflow/Service/device_helper.dart';

class Periodic extends StatelessWidget {
  Periodic({super.key});

  final controller = Get.put(PeriodicController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(105),
        child: Container(
          color: AppColor.main,
          child: Column(
            children: [
              AppBar(
                foregroundColor: AppColor.text1,
                elevation: 0,
                scrolledUnderElevation: 0,
                shadowColor: AppColor.text1,
                title: Text(
                  "Giao dịch định kỳ",
                  style: TextStyle(
                    fontSize: DeviceHelper.getFontSize(21),
                    color: AppColor.text1,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                actions: [
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.walletOverview);
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/wallet-all.svg",
                            height: 25,
                            width: 25,
                          ),
                          const Icon(
                            Icons.arrow_drop_down_rounded,
                            size: 20,
                            color: AppColor.grey,
                          ),
                        ],
                      )),
                  const SizedBox(width: 20),
                ],
              )
            ],
          ),
        ),
      ),
      body: Container(
        color: AppColor.subMain,
        child: Column(
          children: [
            const SizedBox(height: 30),
            Text(
              "Tạo ra định kỳ các giao dịch sẽ được tự dộng thêm trong tương lai.",
              style: TextStyle(
                fontSize: DeviceHelper.getFontSize(14),
                color: AppColor.grey,
                fontWeight: FontWeight.w400,
              ),
            ).marginSymmetric(horizontal: 20),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/empty-box.svg",
                      width: 150,
                      height: 150,
                    ),
                    Text(
                      "Không có giao dịch định kỳ nào nào",
                      style: TextStyle(
                        fontSize: DeviceHelper.getFontSize(15),
                        color: AppColor.text1,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Chạm nút",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: DeviceHelper.getFontSize(14),
                            color: AppColor.grey,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Icon(Icons.add, color: AppColor.text1, size: 20),
                        Text(
                          "để thêm giao dịch định kỳ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: DeviceHelper.getFontSize(14),
                            color: AppColor.grey,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ).marginSymmetric(vertical: 10, horizontal: 20),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.small(
        backgroundColor: AppColor.thirdMain,
        elevation: 0,
        onPressed: () {
          // create periodic
        },
        child: const Icon(Icons.add, color: AppColor.text1, size: 20),
      ),
    );
  }
}
