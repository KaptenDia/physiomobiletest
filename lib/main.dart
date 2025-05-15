import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:physiomobile/di/di.dart';
import 'package:physiomobile/page/root/splash_page.dart';
import 'package:physiomobile/themes/app_colors.dart';
import 'package:physiomobile/utils/navigator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ConfigureExlib();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PhysioMobile',
      debugShowCheckedModeBanner: false,
      navigatorKey: getIt<AppNavigator>().navigatorKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: appColors.primary),
        canvasColor: Colors.transparent,
        useMaterial3: true,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      home: const SplashPage(),
    );
  }
}
