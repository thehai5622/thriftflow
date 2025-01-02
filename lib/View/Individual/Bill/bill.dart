import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:thriftflow/Controller/Individual/Bill/bill_controller.dart';
import 'package:thriftflow/Global/app_color.dart';
import 'package:thriftflow/Route/app_page.dart';
import 'package:thriftflow/Service/device_helper.dart';

class Bill extends StatelessWidget {
  Bill({super.key});

  final controller = Get.put(BillController());

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
                  "Hóa đơn",
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
    return _noBill(context);
  }

  Column _ended(BuildContext context) {
    return _noBill(context);
  }

  Column _noBill(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        Text(
          "Theo dõi hóa đơn của bạn như điện, thuê, internet...",
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
                  "Không có hóa đơn nào",
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
                      "để thêm hóa đơn",
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
    );
  }
}
