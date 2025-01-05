part of 'app_page.dart';

abstract class Routes {
  Routes._();
  static const dashboard = _Paths.dashboard;
  static const home = _Paths.home;
  static const individual = _Paths.individual;
  static const requestSupport = _Paths.requestSupport;
  static const createRequest = _Paths.createRequest;
  static const transactionBook = _Paths.transactionBook;
  static const budget = _Paths.budget;
  static const myWallet = _Paths.myWallet;
  static const accountManagement = _Paths.accountManagement;
  static const notification = _Paths.notification;
  static const walletOverview = _Paths.walletOverview;
  static const walletGuide = _Paths.walletGuide;
  static const group = _Paths.group;
  static const event = _Paths.event;
  static const periodic = _Paths.periodic;
  static const bill = _Paths.bill;
  static const debtBook = _Paths.debtBook;
  static const tool = _Paths.tool;
  static const help = _Paths.help;
  static const introduce = _Paths.introduce;
}

abstract class _Paths {
  _Paths._();
  static const String dashboard = '/dashboard';
  static const String home = '/home';
  static const String individual = '/individual';
  static const String requestSupport = '/request-support';
  static const String createRequest = '/create-request';
  static const String transactionBook = '/transaction-book';
  static const String budget = '/budget';
  static const String myWallet = '/my-wallet';
  static const String accountManagement = '/account-management';
  static const String notification = '/notification';
  static const String walletOverview = '/wallet-overview';
  static const String walletGuide = '/wallet-guide';
  static const String group = '/group';
  static const String event = '/event';
  static const String periodic = '/periodic';
  static const String bill = '/bill';
  static const String debtBook = '/debt-book';
  static const String tool = '/tool';
  static const String help = '/help';
  static const String introduce = '/introduce';
}
