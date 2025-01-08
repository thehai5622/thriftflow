import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thriftflow/Component/tooltip.dart';
import 'package:thriftflow/Global/app_color.dart';
import 'package:thriftflow/Service/device_helper.dart';
import 'package:thriftflow/Utils/wallet_utils.dart';

class WalletGuide extends StatelessWidget {
  const WalletGuide({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: AppColor.main,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      margin: const EdgeInsets.only(bottom: 30),
                      child: Wrap(
                        spacing: 20,
                        direction: Axis.horizontal,
                        runSpacing: 15,
                        children: [
                          _addWalletItem(
                            screenWidth: width,
                            type: WalletUtils.WALLET_BASE,
                            title: "Ví cơ bản",
                            message: "Ví mà bạn tự nhập giao dịch của bạn.",
                          ),
                          _addWalletItem(
                            screenWidth: width,
                            type: WalletUtils.WALLET_CREDIT_CARD,
                            title: "Ví tín dụng",
                            message:
                                "Ví mà bạn tự có thể tự sắp xếp các giao dịch trong tài khoản tính dụng một cách đơn giản và nhắc nhở bạn trước ngày thanh toán.",
                          ),
                          _addWalletItem(
                            screenWidth: width,
                            type: WalletUtils.WALLET_SAVE,
                            title: "Ví tiết kiệm",
                            message:
                                "Ví mà bạn có thể nhập các khoản tiết kiệm của bạn.",
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Ví là gì?",
                          style: TextStyle(
                            fontSize: DeviceHelper.getFontSize(21),
                            color: AppColor.text1,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                        children: [
                          _infoItem(
                            iconData: Icons.attach_money_rounded,
                            title: "Ví đại diện cho nguồn tiền của bạn.",
                          ),
                          _infoItem(
                            iconData: Icons.badge,
                            title: "Trong ví, bạn có thể ghi lại giao dịch hằng ngày để hiểu hơn về tình hình tài chính của mình.",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.maxFinite,
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.fourthMain,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 70),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Đã hiểu",
                    style: TextStyle(
                      fontSize: DeviceHelper.getFontSize(14),
                      color: AppColor.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Stack _addWalletItem({
    required double screenWidth,
    required int type,
    required String title,
    required String message,
  }) {
    final width = (screenWidth - 60) / 2;

    return Stack(
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
    );
  }

  Padding _infoItem({
    required IconData iconData, 
    required String title,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
            height: 35,
            width: 35,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.subMain,
            ),
            child: Icon(
              iconData,
              color: AppColor.text1,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: DeviceHelper.getFontSize(15),
                color: AppColor.grey,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
