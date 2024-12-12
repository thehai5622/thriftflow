import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:thriftflow/Component/tooltip.dart';
import 'package:thriftflow/Controller/Individual/MyWallet/my_wallet_controller.dart';
import 'package:thriftflow/Global/app_color.dart';
import 'package:thriftflow/Service/device_helper.dart';
import 'package:thriftflow/Utils/wallet_utils.dart';

class MyWallet extends StatelessWidget {
  MyWallet({super.key});

  final controller = Get.put(MyWalletController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.main,
        foregroundColor: AppColor.text1,
        elevation: 0,
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
            _walletItem(
              type: WalletUtils.WALLET_BASE,
              title: "Tiền mặt",
              subtitle: "300,000 đ",
            ),
            _walletItem(
              type: WalletUtils.WALLET_CREDIT_CARD,
              title: "Ví tín dụng",
              subtitle: "0 đ",
            ),
            Text(
              "Không tính vào tổng",
              style: TextStyle(
                fontSize: DeviceHelper.getFontSize(15),
                color: AppColor.grey,
                fontWeight: FontWeight.w500,
              ),
            ).paddingSymmetric(horizontal: 20, vertical: 10),
            _walletItem(
              type: WalletUtils.WALLET_BASE,
              title: "Quỹ đen",
              subtitle: "500,000 đ",
            ),
            _walletItem(
              type: WalletUtils.WALLET_SAVE,
              title: "Ví tiết kiệm",
              subtitle: "500,000 đ",
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.fourthMain,
        elevation: 0,
        shape: const CircleBorder(),
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            sheetAnimationStyle: AnimationStyle(
              duration: const Duration(milliseconds: 700),
              reverseDuration: const Duration(milliseconds: 700),
              curve: Curves.fastLinearToSlowEaseIn,
              reverseCurve: Curves.fastLinearToSlowEaseIn,
            ),
            builder: (BuildContext context) {
              return Container(
                width: double.infinity,
                color: AppColor.main,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Thêm ví",
                        style: TextStyle(
                          fontSize: DeviceHelper.getFontSize(16),
                          color: AppColor.text1,
                          fontWeight: FontWeight.w700,
                        ),
                      ).paddingSymmetric(horizontal: 16, vertical: 10),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      margin: const EdgeInsets.only(bottom: 30),
                      child: Wrap(
                        spacing: 20,
                        direction: Axis.horizontal,
                        runSpacing: 15,
                        children: [
                          _addWalletItem(
                            type: WalletUtils.WALLET_BASE,
                            title: "Ví cơ bản",
                            message: "Ví mà bạn tự nhập giao dịch của bạn.",
                            onPressed: () => {},
                          ),
                          _addWalletItem(
                            type: WalletUtils.WALLET_CREDIT_CARD,
                            title: "Ví tín dụng",
                            message:
                                "Ví mà bạn tự có thể tự sắp xếp các giao dịch trong tài khoản tính dụng một cách đơn giản và nhắc nhở bạn trước ngày thanh toán.",
                            onPressed: () => {},
                          ),
                          _addWalletItem(
                            type: WalletUtils.WALLET_SAVE,
                            title: "Ví tiết kiệm",
                            message:
                                "Ví mà bạn có thể nhập các khoản tiết kiệm của bạn.",
                            onPressed: () => {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ).then((value) {});
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  GestureDetector _walletItem({
    required String title,
    required String subtitle,
    required int type,
    void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        color: AppColor.main,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  WalletUtils.getIconWalletByType(type),
                  height: 50,
                  width: 50,
                ),
                const SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: DeviceHelper.getFontSize(14),
                        color: AppColor.text1,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: DeviceHelper.getFontSize(13),
                        color: AppColor.text1,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Icon(
              Icons.more_vert,
              size: 25,
              color: AppColor.grey,
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector _addWalletItem({
    required int type,
    required String title,
    required String message,
    void Function()? onPressed,
    void Function()? onLongPress,
  }) {
    final width = (Get.width - 60) / 2;

    return GestureDetector(
      onTap: onPressed,
      onLongPress: onLongPress,
      child: Stack(
        children: [
          Container(
            width: width,
            height: width / 1.6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: WalletUtils.getColorWalletByType(type),
            ),
          ),
          Positioned(
            top: 4,
            right: 4,
            child: MyTooltip(
              message: message,
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: WalletUtils.getColorBoldWalletByType(type),
                ),
                child: const Center(
                  child: Text(
                    "?",
                    style: TextStyle(
                        fontSize: 16,
                        color: AppColor.white,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            right: 20,
            child: RotationTransition(
              turns: const AlwaysStoppedAnimation(-20 / 360),
              child: SvgPicture.asset(
                WalletUtils.getIconAddWalletByType(type),
                height: width / 2.2,
                width: width / 2.2,
                colorFilter: ColorFilter.mode(
                  WalletUtils.getColorBoldWalletByType(type),
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          Positioned(
            top: 4,
            left: 10,
            right: 30,
            child: Text(
              title,
              style: TextStyle(
                fontSize: DeviceHelper.getFontSize(16),
                color: AppColor.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
