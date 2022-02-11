import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_base_project/core/localization/locale_constants.dart';
import 'package:flutter_base_project/core/providers.dart';
import 'package:flutter_base_project/ui/themes/dark_theme.dart';
import 'package:flutter_base_project/ui/themes/light_theme.dart';
import 'package:flutter_base_project/ui/views/home_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: avoid_void_async
void main() async {
  // Needs to be called so that we can await for EasyLocalization.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  EasyLocalization.logger.enableBuildModes = [];

  final container = ProviderContainer();

  container.read(Providers.versionTrackerService).track(buildHistoryMaxLength: 10, versionHistoryMaxLength: 10);

  const app = App();
  container.read(Providers.errorHandlerService).setHandler(app);

  runApp(
    EasyLocalization(
      child: DevicePreview(
        enabled: !kReleaseMode && kIsWeb,
        builder: (context) => const ProviderScope(child: app),
      ),
      supportedLocales: LocaleConstants.supportedLocales,
      fallbackLocale: LocaleConstants.fallbackLocale,
      path: LocaleConstants.languagesPath,
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: const HomeView(title: 'Flutter Demo Home Page'),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
    );
  }
}
