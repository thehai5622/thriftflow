import 'package:get/get.dart';
import 'package:thriftflow/View/Budget/budget.dart';
import 'package:thriftflow/View/Home/Notification/notification.dart';
import 'package:thriftflow/View/Home/home.dart';
import 'package:thriftflow/View/Individual/AccountManagement/account_management.dart';
import 'package:thriftflow/View/Individual/Bill/bill.dart';
import 'package:thriftflow/View/Individual/Event/event.dart';
import 'package:thriftflow/View/Individual/Group/group.dart';
import 'package:thriftflow/View/Individual/MyWallet/my_wallet.dart';
import 'package:thriftflow/View/Individual/MyWallet/wallet_guide.dart';
import 'package:thriftflow/View/Individual/MyWallet/wallet_overview.dart';
import 'package:thriftflow/View/Individual/Periodic/periodic.dart';
import 'package:thriftflow/View/Individual/RequestSupport/create_request.dart';
import 'package:thriftflow/View/Individual/RequestSupport/request_support.dart';
import 'package:thriftflow/View/TransactionBook/transaction_book.dart';
import 'package:thriftflow/View/dashboard.dart';

part 'app_route.dart';

class AppPage {
  AppPage._();

  static const String initialRoute = Routes.dashboard;

  static final List<GetPage<dynamic>> routes = [
    GetPage(name: Routes.dashboard, page: () => Dashboard()),
    GetPage(name: Routes.home, page: () => Home()),
    GetPage(name: Routes.requestSupport, page: () => RequestSupport()),
    GetPage(name: Routes.createRequest, page: () => CreateRequest()),
    GetPage(name: Routes.transactionBook, page: () => TransactionBook()),
    GetPage(name: Routes.budget, page: () => Budget()),
    GetPage(name: Routes.myWallet, page: () => MyWallet()),
    GetPage(name: Routes.accountManagement, page: () => AccountManagement()),
    GetPage(name: Routes.notification, page: () => Notification()),
    GetPage(name: Routes.walletOverview, page: () => WalletOverview()),
    GetPage(name: Routes.walletGuide, page: () => const WalletGuide()),
    GetPage(name: Routes.group, page: () => Group()),
    GetPage(name: Routes.event, page: () => Event()),
    GetPage(name: Routes.periodic, page: () => Periodic()),
    GetPage(name: Routes.bill, page: () => Bill()),
  ];
}
