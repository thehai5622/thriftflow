import 'package:flutter/material.dart';
import 'package:thriftflow/Global/app_color.dart';
import 'package:thriftflow/Service/device_helper.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo(
      {super.key,
      required this.acronym,
      required this.name,
      required this.email,
      this.isExpendPadding = true,
      this.onTap});

  final void Function()? onTap;
  final String acronym;
  final String name;
  final String email;
  final bool isExpendPadding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: isExpendPadding
            ? const EdgeInsets.symmetric(horizontal: 20, vertical: 40)
            : const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: AppColor.main,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: AppColor.thirdMain,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  acronym,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: DeviceHelper.getFontSize(35),
                    color: AppColor.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: DeviceHelper.getFontSize(16),
                color: AppColor.text1,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              email,
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
