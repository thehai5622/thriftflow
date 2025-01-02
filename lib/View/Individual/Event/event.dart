import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:thriftflow/Controller/Individual/Event/event_controller.dart';
import 'package:thriftflow/Global/app_color.dart';
import 'package:thriftflow/Route/app_page.dart';
import 'package:thriftflow/Service/device_helper.dart';

class Event extends StatelessWidget {
  Event({super.key});

  final controller = Get.put(EventController());

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
                  "Sự kiện",
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
              ),
              TabBar(
                unselectedLabelColor: AppColor.grey,
                labelColor: AppColor.text1,
                dividerColor: AppColor.subMain,
                isScrollable: true,
                indicatorColor: AppColor.text1,
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                tabs: const [
                  Tab(
                    child: Text("Đang áp dụng"),
                  ),
                  Tab(
                    child: Text("Đã kết thúc"),
                  ),
                ],
                controller: controller.tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                tabAlignment: TabAlignment.center,
                labelStyle: TextStyle(
                  fontSize: DeviceHelper.getFontSize(14),
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
      body: Container(
        color: AppColor.subMain,
        child: TabBarView(
          controller: controller.tabController,
          children: [
            _currentlyApplying(context),
            _ended(context),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.small(
        backgroundColor: AppColor.thirdMain,
        elevation: 0,
        onPressed: () {
          // create event
        },
        child: const Icon(Icons.add, color: AppColor.text1, size: 20),
      ),
    );
  }

  Column _currentlyApplying(BuildContext context) {
    return _noEvent(context);
  }

  Column _ended(BuildContext context) {
    return _noEvent(context);
  }

  Column _noEvent(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        Text(
          "Tạo một sự kiện trong ứng dụng để theo dõi việc chi tiêu trong một sự kiện có tực nào đó, ví dụ như là tu sửa nhà cửa.",
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
                  "Không có sự kiện nào",
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
                      "để thêm sự kiện",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: DeviceHelper.getFontSize(14),
                        color: AppColor.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ).marginSymmetric(vertical: 10, horizontal: 20),
                GestureDetector(
                  onTap: () => _showDialog(context),
                  child: Text(
                    "SỰ KIỆN",
                    style: TextStyle(
                      fontSize: DeviceHelper.getFontSize(15),
                      color: AppColor.thirdMain,
                      fontWeight: FontWeight.w700,
                    ),
                  ).marginSymmetric(vertical: 10, horizontal: 20),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 60),
      ],
    );
  }

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColor.main,
          contentPadding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sự kiện",
                style: TextStyle(
                  fontSize: DeviceHelper.getFontSize(20),
                  color: AppColor.text1,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(vertical: 10),
                color: AppColor.subMain,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColor.main,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/group-home.svg",
                        width: 35,
                        height: 35,
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sửa nhà cửa",
                              style: TextStyle(
                                fontSize: DeviceHelper.getFontSize(18),
                                color: AppColor.text1,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "Đã chi",
                              style: TextStyle(
                                fontSize: DeviceHelper.getFontSize(14),
                                color: AppColor.grey,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "\$1000",
                        style: TextStyle(
                          fontSize: DeviceHelper.getFontSize(15),
                          color: AppColor.text1,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                "Tạo một sự kiện trong ứng dụng để theo dõi việc chi tiêu trong một sự kiện có tực nào đó, ví dụ như là tu sửa nhà cửa.",
                style: TextStyle(
                  fontSize: DeviceHelper.getFontSize(14),
                  color: AppColor.grey,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "Chế độ du lịch",
                style: TextStyle(
                  fontSize: DeviceHelper.getFontSize(18),
                  color: AppColor.text1,
                  fontWeight: FontWeight.w700,
                ),
              ).marginSymmetric(vertical: 10),
              Text(
                "Khi bạn đang ở trong một sự kiện, hãy bật 'Chế độ du lịch' lên để tất cả các giao dịch được tạo sẽ được thêm vào trong sự kiện này.",
                style: TextStyle(
                  fontSize: DeviceHelper.getFontSize(14),
                  color: AppColor.grey,
                  fontWeight: FontWeight.w400,
                ),
              ).marginSymmetric(vertical: 10),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Text(
                    "ĐÓNG",
                    style: TextStyle(
                      fontSize: DeviceHelper.getFontSize(15),
                      color: AppColor.thirdMain,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
