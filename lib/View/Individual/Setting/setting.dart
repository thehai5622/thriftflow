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
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 10),
          children: [
            _titleSetting(title: "Hiển thị"),
            _settingItem(
              title: "Giao diện",
            ),
            _settingItem(
              title: "Kiểu hiển thị số tiền",
            ),
            _settingItem(
              title: "Đơn vị tiền cho các ví",
              description: "VND",
            ),
            _settingItem(
              title: "Định dạng ngày tháng",
              description: "06/01/2025",
            ),
            _settingItem(
              title: "Chọn ngày đầu tuần",
              description: "Thứ Hai",
            ),
            _settingItem(
              title: "Chọn ngày đầu tiên của tháng",
              description: "1",
            ),
            _settingItem(
              title: "Chọn tháng đầu tiên của năm",
              description: "Tháng 1",
            ),
            _settingItem(
              title: "Khoảng thời gian trong tương lai",
              description: "3 tháng",
            ),
            _settingItem(
              title: "Không tính vào báo cáo",
              description:
                  "Bật tùy chọn không tính vào báo cáo tại thêm giao dịch và sửa giao dịch.",
              suffix: Obx(
                () => Transform.scale(
                  scale: 0.8,
                  child: Switch(
                    value: controller.isIncludedInTheReport.value,
                    onChanged: (value) {
                      controller.isIncludedInTheReport.value = value;
                    },
                  ),
                ),
              ),
            ),
            _settingItem(
              title: "Luôn hiển thị chi tiết giao dịch",
              suffix: Obx(
                () => Transform.scale(
                  scale: 0.8,
                  child: Switch(
                    value: controller.isShowDetailTransaction.value,
                    onChanged: (value) {
                      controller.isShowDetailTransaction.value = value;
                    },
                  ),
                ),
              ),
            ),
            _settingItem(
              title: "Chế độ hiển thị Tổng quan",
              description: "Hiện theo tiền vào/tiền ra",
            ),
            const SizedBox(height: 10),
            _titleSetting(title: "Thông báo"),
            _settingItem(
              title: "Âm thanh thông báo",
              description: "Bật âm thanh cho thông báo",
              suffix: Obx(
                () => Transform.scale(
                  scale: 0.8,
                  child: Switch(
                    value: controller.isShowSoundNotification.value,
                    onChanged: (value) {
                      controller.isShowSoundNotification.value = value;
                    },
                  ),
                ),
              ),
            ),
            _settingItem(
              title: "Nhắc thêm giao dịch hằng ngày",
              description: "20:00",
            ),
            _settingItem(
              title: "Hiện ví trên thanh trạng thái",
            ),
            const SizedBox(height: 10),
            _titleSetting(title: "Hệ thống"),
            _settingItem(
              title: "Sử dụng mật khẩu",
              description: "Chưa đặt",
            ),
            const SizedBox(height: 10),
            _titleSetting(title: "Cơ sở dữ liệu"),
            _settingItem(
              title: "Đồng bộ chỉ khi dùng WIFI",
              description: "Cập nhật lần cuối ít hơn một phút trước",
              suffix: Obx(
                () => Transform.scale(
                  scale: 0.8,
                  child: Switch(
                    value: controller.isSyncOverWifiOnly.value,
                    onChanged: (value) {
                      controller.isSyncOverWifiOnly.value = value;
                    },
                  ),
                ),
              ),
            ),
            _settingItem(
              title: "Chạm để cập nhật tỷ giá",
              description: "Ít hơn một phút trước",
            ),
            _settingItem(
              title: "Đăng xuất",
              description: "luonghai5622@gmail.com",
            ),
            const SizedBox(height: 10),
            _titleSetting(title: "Giới thiệu"),
            _settingItem(
              title: "Hướng dẫn",
            ),
            _settingItem(
              title: "Giới thiệu",
            ),
          ],
        ),
      ),
    );
  }

  Container _titleSetting({
    required String title,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      color: AppColor.main,
      child: Text(
        title,
        style: TextStyle(
          fontSize: DeviceHelper.getFontSize(14),
          color: AppColor.fourthMain,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  GestureDetector _settingItem({
    required String title,
    String? description,
    Widget? suffix,
    void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        color: AppColor.main,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
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
                  if (description != null)
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: DeviceHelper.getFontSize(13),
                        color: AppColor.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                ],
              ),
            ),
            if (suffix != null)
              Row(
                children: [
                  const SizedBox(width: 20),
                  suffix,
                ],
              )
          ],
        ),
      ),
    );
  }
}
