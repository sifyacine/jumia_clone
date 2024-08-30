import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jumia_clone/utils/bindings/general_bindings.dart';
import 'package:jumia_clone/utils/constants/colors.dart';
import 'package:jumia_clone/utils/theme/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'features/personalization/controllers/local_controller.dart';
import 'generated/l10n.dart';

class MyApp extends StatelessWidget {
  final LocaleController localeController = Get.put(LocaleController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
      initialBinding: GeneralBindings(),
      locale: localeController.locale.value,
      localizationsDelegates: const [
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
      home: const LoaderPage(),
    ));
  }
}

class LoaderPage  extends StatelessWidget {
  const LoaderPage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.primaryColor,
      body: Center(
        child: CircularProgressIndicator(color: Colors.white)
      ),
    );
  }
}

