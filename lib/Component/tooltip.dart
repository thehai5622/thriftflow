import 'package:flutter/material.dart';
import 'package:thriftflow/Global/app_color.dart';
import 'package:thriftflow/Service/device_helper.dart';

class MyTooltip extends StatelessWidget {
  const MyTooltip({super.key, required this.child, this.message});

  final String? message;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      preferBelow: true,
      showDuration: const Duration(seconds: 10),
      triggerMode: TooltipTriggerMode.tap,
      textStyle: TextStyle(
        fontSize: DeviceHelper.getFontSize(15),
        color: AppColor.white,
        fontWeight: FontWeight.w400,
      ),
      decoration: BoxDecoration(
        color: AppColor.text1,
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}
