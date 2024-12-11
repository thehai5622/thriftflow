import 'package:get/get.dart';
import 'package:thriftflow/View/Budget/budget.dart';
import 'package:thriftflow/View/Home/home.dart';
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
  ];
}
