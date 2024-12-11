import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:thriftflow/Controller/Individual/MyWallet/my_wallet_controller.dart';
import 'package:thriftflow/Global/app_color.dart';
import 'package:thriftflow/Service/device_helper.dart';

class MyWallet extends StatelessWidget {
  MyWallet({super.key});

  final controller = Get.put(MyWalletController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.main,
        foregroundColor: AppColor.text1,
        elevation: 0.5,
        shadowColor: AppColor.text1,
        title: Text(
          "Ví của tôi",
          style: TextStyle(
            fontSize: DeviceHelper.getFontSize(21),
            color: AppColor.text1,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          GestureDetector(
              onTap: () {
                // Search
              },
              child: SvgPicture.asset(
                "assets/icons/search.svg",
                height: 25,
                width: 25,
                colorFilter: const ColorFilter.mode(
                  AppColor.text1,
                  BlendMode.srcIn,
                ),
              )),
          const SizedBox(width: 12),
        ],
      ),
      body: Container(
        color: AppColor.subMain,
        child: ListView(
          children: [
            Text(
              "Tính vào tổng",
              style: TextStyle(
                fontSize: DeviceHelper.getFontSize(15),
                color: AppColor.grey,
                fontWeight: FontWeight.w500,
              ),
            ).paddingSymmetric(horizontal: 20, vertical: 10),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.fourthMain,
        elevation: 0,
        shape: const CircleBorder(),
        onPressed: () {
          print('on press');
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
