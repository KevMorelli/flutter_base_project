import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_base_project/core/providers.dart';
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

  container.read(Providers.versionTrackerProvider).track(buildHistoryMaxLength: 10, versionHistoryMaxLength: 10);

  const app = App();
  container.read(Providers.errorHandlerProvider).setHandler(app);

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
      home: const HomePage(title: 'Flutter Demo Home Page'),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              tr(Translations.counterLabel),
            ),
            const CounterWidget(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(Providers.counterViewModel).increase(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CounterWidget extends ConsumerStatefulWidget {
  const CounterWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends ConsumerState<CounterWidget> {
  @override
  Widget build(BuildContext context) {
    final _counterViewModel = ref.watch(Providers.counterViewModel);

    return Text(
      _counterViewModel.counter.toString(),
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
