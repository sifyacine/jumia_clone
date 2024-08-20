import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jumia_clone/utils/theme/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'features/authentication/screens/onboarding/onboarding_screen.dart';
import 'features/personalization/controllers/local_controller.dart';
import 'generated/l10n.dart';

class MyApp extends StatelessWidget {
  final LocaleController localeController = Get.put(LocaleController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
      locale: localeController.locale.value,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home: const OnBoardingScreen(),
    ));
  }
}
