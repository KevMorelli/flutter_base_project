import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_base_project/core/top_level_providers.dart';
import 'package:flutter_base_project/core/translations_keys.dart';
import 'package:flutter_base_project/ui/themes/dark_theme.dart';
import 'package:flutter_base_project/ui/themes/light_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: avoid_void_async
void main() async {
  // Needs to be called so that we can await for EasyLocalization.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  EasyLocalization.logger.enableBuildModes = [];

  final container = ProviderContainer();

  container.read(versionTrackerProvider).track(buildHistoryMaxLength: 10, versionHistoryMaxLength: 10);

  const app = App();
  container.read(errorHandlerProvider).setHandler(app);

  runApp(
    EasyLocalization(
      child: DevicePreview(
        enabled: !kReleaseMode && kIsWeb,
        builder: (context) => const ProviderScope(child: app),
      ),
      supportedLocales: const [Locale('en'), Locale('es')],
      fallbackLocale: const Locale('en'),
      path: 'assets/translations',
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final count = ref.watch(counterProvider);
    // final counter = ref.read(counterProvider);
    context.setLocale(const Locale('es'));
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              tr(Translations.test),
            ),
            Text(
              '1', //count.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
            TextButton(
              onPressed: () => {context.setLocale(const Locale('es'))},
              child: const Text('Test'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     try {
//       throw 'Test exception';
//     } catch (error, stackTrace) {
//       errorHandler!.reportError(error, stackTrace);
//     }
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {}
// }
