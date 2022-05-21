import 'package:fast_ui/common/font_name.dart';
import 'package:fast_ui/common/theme/app_theme.dart';
import 'package:fast_ui/common/theme/theme_service.dart';
import 'package:fast_ui/routes/index.dart';
import 'package:fast_ui/views/pages/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    lockScreenPortrait();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    return /*GetMaterialApp(
      builder: (context, widget) {
        //ScreenUtil.setContext(context);
        return MediaQuery(
          //Setting font does not change with system font size
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: widget!,
        );
      },
      debugShowCheckedModeBanner: false,
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'), // tran
      title: FontName().appName,
      home: const SplashScreen(),
      getPages: appRoute.getPages,
      theme: AppTheme.fromType(ThemeType.light).themeData,
      darkTheme: AppTheme.fromType(ThemeType.dark).themeData,
      themeMode: ThemeService().theme,
    );*/
        ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (BuildContext c, child) => GetMaterialApp(
        builder: (context, widget) {
          //ScreenUtil.setContext(context);
          return MediaQuery(
            //Setting font does not change with system font size
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
          );
        },
        debugShowCheckedModeBanner: false,
        locale: const Locale('en', 'US'),
        fallbackLocale: const Locale('en', 'US'), // tran
        title: FontName().appName,
        home: const SplashScreen(),
        getPages: appRoute.getPages,
        theme: AppTheme.fromType(ThemeType.light).themeData,
        darkTheme: AppTheme.fromType(ThemeType.dark).themeData,
        themeMode: ThemeService().theme,
      ),
    );
  }

  lockScreenPortrait() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
