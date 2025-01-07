import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:thriftflow/Route/app_page.dart';

import 'Global/app_color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
  final Iterable<Locale> supportedLocales = const [
    Locale('en', 'US'),
    Locale('vi', 'VN'),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => GetMaterialApp(
        localizationsDelegates: localizationsDelegates,
        supportedLocales: supportedLocales,
        title: 'Thrift Flow',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColor.fourthMain),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            titleSpacing: 20,
            elevation: 0,
            foregroundColor: AppColor.text1,
            backgroundColor: AppColor.main,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: AppColor.transparent,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.dark,
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: AppPage.initialRoute,
        getPages: AppPage.routes,
      ),
    );
  }
}
